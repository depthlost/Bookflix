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
	chapters := OrderedCollection new
]
