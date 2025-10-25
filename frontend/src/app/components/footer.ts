import { DatePipe } from "@angular/common";
import { Component } from "@angular/core";


@Component({
    selector: 'ots-footer',
    imports: [DatePipe],
    template: `
        <footer class="bg-gray-400 h-[15%] p-4">            
            <p class="text-white">&copy; {{ date | date: 'yyyy' }} Ots</p>            
        </footer>
    `
})
export class Footer {

    date = new Date();
}
