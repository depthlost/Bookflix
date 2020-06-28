Class {
	#name : #ListComponent,
	#superclass : #WAComponent,
	#instVars : [
		'title',
		'items',
		'itemBlock'
	],
	#category : #'Bookflix-UI-resources'
}

{ #category : #constructor }
ListComponent class >> withTitle: aTitle blocks: aCollection [
	^ self new
		withTitle: aTitle
		collection: aCollection
		do: [ :each :html | each value: html ]
]

{ #category : #constructor }
ListComponent class >> withTitle: aTitle collection: aCollection [
	^ self new
		withTitle: aTitle
		collection: aCollection
		do: [ :each :html | html text: each asString ]
]

{ #category : #constructor }
ListComponent class >> withTitle: aTitle collection: aCollection do: aBlock [
	^ self new withTitle: aTitle collection: aCollection do: aBlock
]

{ #category : #constructor }
ListComponent class >> withTitle: aTitle components: aCollection [
	^ self new
		withTitle: aTitle
		collection: aCollection
		do: [ :each :html | html render: each ]
]

{ #category : #rendering }
ListComponent >> renderContentOn: html [
	html div
		class: 'card';
		with: [ self
				renderTitleOn: html;
				renderListOn: html ]
]

{ #category : #rendering }
ListComponent >> renderListItem: anItem on: html [
	html listItem
		class: 'list-group-item';
		with: [ itemBlock value: anItem value: html ]
]

{ #category : #rendering }
ListComponent >> renderListOn: html [
	html unorderedList
		class: 'list-group list-group-flush';
		with: [ items do: [ :each | self renderListItem: each on: html ] ]
]

{ #category : #rendering }
ListComponent >> renderTitleOn: html [
	html div
		class: 'card-header';
		with: title
]

{ #category : #initialization }
ListComponent >> withTitle: aTitle collection: aCollection do: aBlock [
	title := aTitle.
	items := aCollection.
	itemBlock := aBlock
]
