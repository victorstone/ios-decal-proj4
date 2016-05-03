# NoteMap
## Authors
Victor Stone
## Purpose
When studying for classes, especially CS classes, I've always found it hard to connect 
my notes with the where I found them in the given texts or lectures. With NoteMap, you can 
link a pdf, video, or both with each concept and view them in an organized
fashion. 
## Features
* Create note items that contain a main idea
* Each note item and subitem can link with any pdf, video, or even website

## Control Flow
* Start off with a screen with a table of classes, initially blank, but you can add classes with a button
* Each Class has a table of notes 
* Within each note, you can add a link to a pdf or video with a title
* Each time you click the link, you will be brought to a webview displaying the resource

## Implementation
Class view is implemented with a UITableView, as is the Note View. Each note leads to another view that has multiple table views, one for pdfs (or really any webstie), and one for videos. The resources are displayed view a UIWebView

## Model
Most data is stored as a series of dictionaries that link together note, class, and subject names with their classes respectively. 

## View
ClassTableView, NotesForClassTableView, AddNotesView, WebView

## Controller 
ClassTableViewController, NotesForClassTableViewController, AddNotesViewController, WebViewController

