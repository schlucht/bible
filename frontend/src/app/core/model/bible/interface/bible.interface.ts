
export interface DateInfo {
    date: string;
    timezone_type: number;
    timezone: string;
  }
  
  export interface Testament {
    id: number;
    name: string; // "AT" oder "NT"
    createdAt: DateInfo;
    updatedAt: DateInfo;
  }
  
  export interface Book {
    id: number;
    testament: Testament;
    name: string;
    abbreviation: string;
    author: string;
    year: string;
    description: string;
    createdAt: DateInfo;
    updatedAt: DateInfo;
  }
  
  export type Books = Book[];
  export type Testaments = Testament[];
  