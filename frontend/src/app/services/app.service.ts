import { inject, Injectable } from "@angular/core";
import { API } from "../app.config";
import { HttpClient } from "@angular/common/http";

@Injectable({
    providedIn: 'root'
})
export class AppService {
    url = API;
    http = inject(HttpClient)
    result:string = "";
    constructor() { }
    sayHello() {
        return this.http.get(this.url)
    }
 
}