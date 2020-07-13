Class {
	#name : #ActionListComponent,
	#superclass : #WAComponent,
	#instVars : [
		'title',
		'items'
	],
	#category : #'Bookflix-UI-resources'
}

{ #category : #constructor }
ActionListComponent class >> withTitle: aTitle components: someActionItems [
	^ self new withTitle: aTitle components: someActionItems
]

{ #category : #seaside }
ActionListComponent >> children [
	^ items
]

{ #category : #rendering }
ActionListComponent >> renderContentOn: html [
	html div
		class: 'card';
		with: [ self
				renderTitleOn: html;
				renderListOn: html ]
]

{ #category : #rendering }
ActionListComponent >> renderListItem: anItem on: html [
	html anchor
		class: 'list-group-item list-group-item-action';
		callback: [ anItem onClick ];
		with: [ html render: anItem ]
]

{ #category : #rendering }
ActionListComponent >> renderListOn: html [
	html div
		class: 'list-group list-group-flush';
		with: [ items do: [ :each | self renderListItem: each on: html ] ]
]

{ #category : #rendering }
ActionListComponent >> renderTitleOn: html [
	html div
		class: 'card-header';
		with: title
]

{ #category : #seaside }
ActionListComponent >> states [
	^ Array with: self
]

{ #category : #initialization }
ActionListComponent >> withTitle: aTitle components: someActionItems [
	title := aTitle.
	items := someActionItems
]
