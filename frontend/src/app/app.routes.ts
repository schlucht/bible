import { Routes } from '@angular/router';
import { AdminPage } from './admin/admin-page/admin-page';
import { DashboardPage } from './dashboard/dashboard-page/dashboard-page';

export const routes: Routes = [
    {path: '', component: DashboardPage},
    {path: 'admin', component: AdminPage},
    {path: '**', redirectTo: ''},    
];
