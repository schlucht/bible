import { Component } from '@angular/core';
import { CommentsItem } from '../comments-item/comment-item';

@Component({
  selector: 'ots-comment-list',
  imports: [CommentsItem],
  templateUrl: './comment-list.html',
  styleUrl: './comment-list.css',
})
export class CommentList {

}
