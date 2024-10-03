'use client'

import {Button} from "@/components/ui/shadcn/button.tsx"
import Interface from "@/components/ui/interface.tsx";
import {DesktopList} from "@/components/ui/desktop-list.tsx";

export default function AdminPanel() {
    return (
        <div className="min-h-screen bg-black text-green-500 p-4 font-mono">
            <DesktopList />
            <div className="max-w-4xl mx-auto bg-black/50 rounded-lg shadow-lg overflow-hidden border border-green-500">
                <Interface />
                <div className="flex justify-center pb-4">
                    <Button
                        className="mr-4 bg-green-900/50 hover:bg-green-700/50 text-green-400 border border-green-500 shadow-lg shadow-green-500/50">
                        Activate
                    </Button>
                    <Button
                        className="bg-red-900/50 hover:bg-red-700/50 text-red-400 border border-red-500 shadow-lg shadow-red-500/50">
                        Deactivate
                    </Button>
                </div>
            </div>
        </div>
    )
}