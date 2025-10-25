import { JsonPipe } from "@angular/common";
import { Component } from "@angular/core";
import { FormsModule, NgForm } from "@angular/forms";

type User = {
    firstname: string;
    lastname: string;
    email: string;
    password: string;
}

@Component({
    selector: 'ots-signin',
    imports:[FormsModule, JsonPipe],
    template: `
        <div class="flex justfy-center items-center w-full">
            <form #signIn="ngForm" class="w-120 mx-auto" (ngSubmit)="onSubmit(signIn)">
                <div  class="flex flex-col gap-4">
                    @if(signIn.invalid && signIn.touched){
                        <p class="text-red-500">Es sind nicht alle Felder ausgefüllt!</p>
                    }
                    <label for="firstname">Vorname</label>
                    <input class="input-text" ngModel name="firstname" type="text" placeholder="Vorname" required>
                    <label for="lastname">Nachname</label>
                    <input class="input-text" ngModel name="lastname" type="text" placeholder="Nachname" required>
                    <label for="email">Email</label>
                    <input class="input-text" ngModel name="email" type="email" placeholder="Email" required>
                    <label for="password">Passwort</label>
                    <input class="input-text" ngModel name="password" type="password" placeholder="Passwort" required>
                    <div>                        
                        <button [disabled]="!signIn.valid" type="submit" class="border-solid border-1 border-black-400 p-2 rounded-md bg-gray-600 text-white cursor-pointer hover:bg-gray-500 disabled:bg-gray-200">Registrieren</button> oder <a class="underline text-blue-600 cursor-pointer" routerLink="">Anmelden</a>
                    </div>
                 </div> 
                 <pre>{{ ausgabe | json }}</pre>
            </form>
        </div>
    `
})
export class Signin{
    ausgabe:User = {firstname:'', lastname:'', email:'', password:''};
    onSubmit(form: NgForm) {
        console.log('submit: ', form.value.firstname);
        this.ausgabe = {
            firstname:form.value.firstname,
            lastname:form.value.lastname,
            email:form.value.email,
            password:form.value.password,
      };
    }
}