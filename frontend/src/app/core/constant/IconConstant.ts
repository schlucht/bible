import { Type } from '@angular/core';
import { HomeIcon } from '../../shared/icons/home-icon';
import { BookIcon } from '../../shared/icons/book-icon';
import { DeleteIcon } from '../../shared/icons/delete-icon';


const ICONS = ['home', 'book', 'delete', 'moon'];
export type IconName = typeof ICONS[number];

export const IcoMap: Record<string, Type<any>> = {
  home: HomeIcon,
  book: BookIcon,
  delete: DeleteIcon,
}
