import { Button } from "@/components/ui/shadcn/button"
import {
  Sheet,
  // SheetClose,
  SheetContent,
  SheetDescription,
  SheetFooter,
  SheetHeader,
  SheetTitle,
  SheetTrigger,
} from "@/components/ui/shadcn/sheet.tsx"

export function DesktopList() {


  fetch("http://localhost:8080/users")

  return (
    <Sheet>
      <SheetTrigger asChild>
        <Button variant="outline" className="bg-dark/50 border border-green-500 text-green-600">List of infected users</Button>
      </SheetTrigger>
      <SheetContent side="left" className="bg-dark border border-green-500">
        <SheetHeader>
          <SheetTitle className="text-green-500 ">List of infected users</SheetTitle>
          <SheetDescription>
            Chose one of the following infected users to start messing with their PC.
          </SheetDescription>
        </SheetHeader>
        <SheetFooter>



        </SheetFooter>
      </SheetContent>
    </Sheet>
  )
}
