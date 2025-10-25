import { Component } from "@angular/core";
import { RouterLink } from "@angular/router";

@Component({
    selector: 'ots-header',
    imports: [RouterLink],
    template: `
        <header class="h-[15%] bg-gray-400 p-4 flex justify-between items-center flex-row">
            <div class="">
                <img src="logos/log_normal.svg" alt="Logo" class="h-16 w-16">
            </div>
            <div class="flex flex-row gap-12">
                <a routerLink="" class="text-xl font-black text-white">Home</a>
                <a routerLink="signin" class="text-xl font-black text-white">Registrieren</a>
                <a routerLink="" class="text-xl font-black text-white">Einkaufen</a>
                <a routerLink="" class="text-xl font-black text-white">Gemeinde</a>
            </div>
        </header>
    `
})
export class Header {}