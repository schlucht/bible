import { HttpClient } from '@angular/common/http';
import { inject, Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root',
})
export class UserService {
  httpClient = inject(HttpClient);
  path = 'https://8888-firebase-bible-1762163003792.cluster-64pjnskmlbaxowh5lzq6i7v4ra.cloudworkstations.dev/api/users';

  allUsers() {
    return this.httpClient.get(this.path);
  }


}
