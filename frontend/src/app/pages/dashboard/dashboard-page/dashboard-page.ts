import { Component } from '@angular/core';
import { BibleComment} from '../biblecomment/bible-comment';
import { CommentForm } from '../comment-form/comment-form';
import { CommentList } from '../comments-list/comment-list';
import { DatePicker } from '../../../shared/reusables/date-picker/date-picker';

@Component({
  selector: 'ots-dashboard-page',
  imports: [BibleComment, CommentForm, CommentList, DatePicker],
  templateUrl: './dashboard-page.html',
  styleUrl: './dashboard-page.css',
})
export class DashboardPage {

}
