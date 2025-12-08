
import { FormsModule, NgForm } from "@angular/forms";
import { RouterLink, RouterOutlet } from "@angular/router";
import { HomeIcon } from "../../shared/icons/home-icon";
import { Icon } from "../../shared/icons/icon";

export const FormModules = [FormsModule, NgForm];
export const RouterModules = [RouterOutlet, RouterLink];
export const IconModule = [HomeIcon, Icon]
