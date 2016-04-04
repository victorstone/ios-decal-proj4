# NoteMap
## Authors
Victor Stone
## Purpose
When studying for classes, especially CS classes, I've always found it hard to connect 
my notes with the where I found them in the given texts or lectures. With NoteMap, you can 
link a pdf, video, or portion of either with each concept and view them in an organized
fashion. 
## Features
* Create note items that contain a main idea and any subpoints
* Each note item and subitem can link with any pdf, video, or portion of
  * You can select a starting and ending point for videos, and a starting end point of a pdf 
* For videos short enough, you can download them for offline viewing

## Control Flow
* Start off with a screen with a table of classes, initially blank, but you can add classes with a button
* Within the each class you have full control over whether to create subtopics, or actual notes. 
* Within each note, you can add a link to a pdf or video with a title
* Each time you click the link, you will be brought to either a video player or text viewer to view the resource

## Implementation
(Definitely incomplete and open to change)
Probably going to use a lot of custom table views and cells that allow for an aesthetically pleasing way to show topics, notes, etc. The only things up for grabs are the pdf viewer and the video player, the latter of which will probably come from the youtube API. 
## Model
(Definitely incomplete and open to change)
Probably a custom class that contains a dictionary of dictionaries. Everything that is not a note is essentially another dictionary.

## View
(Definitely incomplete and open to change)
ClassTableView, TopicTableView, PDFView, VideoView, YTView
## Controller 
(Definitely incomplete and open to change)
ClassTableViewController, TopicTableViewController, PDFViewController, VideoViewController, YTViewController
