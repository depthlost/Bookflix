Class {
	#name : #ChapterBook,
	#superclass : #Book,
	#instVars : [
		'chapters'
	],
	#category : #'Bookflix-Model'
}

{ #category : #initialization }
ChapterBook >> initialize [
	super initialize.
	chapters := OrderedCollection new
]
