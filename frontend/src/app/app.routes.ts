import { Routes } from '@angular/router';
import { AdminPage } from './pages/admin/admin-page/admin-page';
import { DashboardPage } from './pages/dashboard/dashboard-page/dashboard-page';
import { Bible } from './pages/bible/bible/bible';
import { Book } from './pages/bible/book/book';

export const routes: Routes = [
    {path: '', component: DashboardPage},
    {path: 'admin', component: AdminPage},
    {path: 'bible', component: Bible, children: [
        {path: 'book', component: Book}
    ]},
    {path: '**', redirectTo: ''},    
];
