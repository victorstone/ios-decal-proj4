//
//  dataStorage.swift
//  NoteMap
//
//  Created by Victor Stone on 4/29/16.
//  Copyright © 2016 Victor Stone. All rights reserved.
//

import Foundation

class mainData {
    
    var subjects : [String : SubjectItem]!
    var noteForClasses : [String : [NoteItem]]!
    var Classes : [String : ClassItem]!
    
    init() {
        subjects = [String : SubjectItem]()
        noteForClasses = [String : [NoteItem]]()
        Classes = [String : ClassItem]()
    }
    
    /********************Accessor***********************/
    
    func getNotesForClass(className : String) -> [NoteItem]? {
        if let noteOptional = noteForClasses[className] {
            return noteOptional
        }
        return nil
    }
    
    func getClasses() -> [String : ClassItem] {
        return Classes
    }
    
    func getSubjects() -> [String : SubjectItem] {
        return subjects
    }
    
    func classAlreadyExists(name: String) -> Bool {
        if let _ = Classes[name] {
            return true
        }
        return false
    }
    
    func getIndexForNoteForClassAndNoteName(classname : String, notename: String) -> Int? {
        var count = 0
        for note in noteForClasses[classname]! {
            if note.identifier == notename {
                return count
            }
            count += 1
        }
        return nil
    }
    
    /*********************Setters************************/
    
    func addClass(newClass : ClassItem) -> Int {
        if subjects[newClass.subject] == nil {
            subjects[newClass.subject] = SubjectItem(name: newClass.subject)
        }
        if let _ = Classes[newClass.className] {
            //Failed to create new class due to existing class with the same name
            return 1
        }
        Classes[newClass.className] = newClass
        noteForClasses[newClass.className] = [NoteItem]()
        return 0
    }
    
    func removeClass(classToRemove : ClassItem) -> Int {
        if let _ = Classes.removeValueForKey(classToRemove.className) {
            return 0
        }
        //Failed to remove class for... whatever reason
        return 1
    }
    
    
    func addNote(note : NoteItem) -> Int {
        if var Class = noteForClasses[note.className] {
            Class.append(note)
            return 0
        }
        //failed to add Note for whatever reason
        return 1
    }
    
    func removeNote(note : NoteItem) -> Int {
        if var Class = noteForClasses[note.className] {
            Class = Class.filter() { $0 !== note }
            return 0
        }
        //Failure for some reason. Fuck me.
        return 1
    }
    
    
    
}