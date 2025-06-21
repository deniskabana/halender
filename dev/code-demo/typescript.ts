import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';
import { AppComponent } from './app.component';

export enum Sections {
  Dashboard = 'dashboard',
  Settings = 'settings',
};

type MyType = <Generic extends any[] | undefined>(arg: never) => Generic;

/**
 * JSDoc descriibing a function
 * @example debug("Foo")
 */
function debug(message?: string): void {
  if (!message) throw new Error('Message is required');
  console.debug(message);
}

@NgModule({
  imports: [
    BrowserModule,
    FormsModule
  ],
  declarations: [
    AppComponent
  ],
  bootstrap: [AppComponent]
})

export class AppModule { }
