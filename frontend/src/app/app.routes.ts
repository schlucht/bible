import { Routes } from '@angular/router';
import { HomePage } from './pages/home';
import { PageNotFound } from './pages/404';
import { Signin } from './pages/signin';

export const routes: Routes = [
    {path: '', component: HomePage},
    {path: 'signin', component: Signin},
    {path: '**', component: PageNotFound}    
];
