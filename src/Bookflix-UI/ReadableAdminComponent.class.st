Class {
	#name : #ReadableAdminComponent,
	#superclass : #ReadableComponent,
	#instVars : [
		'readableComponent'
	],
	#category : #'Bookflix-UI-readables'
}

{ #category : #construction }
ReadableAdminComponent class >> decorateTo: aReadableComponent [
	^ (self
		with: aReadableComponent readable
		in: aReadableComponent parentComponent)
		readableComponent: aReadableComponent
]

{ #category : #callbacks }
ReadableAdminComponent >> goToModifyReadable [
	parentComponent
		call:
			(readable className = 'Novelty'
				ifTrue: [ SetNoveltyComponent with: readable ]
				ifFalse: [ SetBookComponent with: readable ])
]

{ #category : #initialization }
ReadableAdminComponent >> readableComponent: aReadableComponent [
	readableComponent := aReadableComponent
]

{ #category : #private }
ReadableAdminComponent >> removeModalClass [
	^ readable className = 'Novelty'
		ifTrue: [ RemoveNoveltyModalComponent ]
		ifFalse: [ readable className = 'Advance'
				ifTrue: [ RemoveTrailerModalComponent ]
				ifFalse: [ RemoveBookModalComponent ] ]
]

{ #category : #rendering }
ReadableAdminComponent >> renderBookContentOn: html [
	super renderBookContentOn: html.
	self renderBookFooterOn: html
]

{ #category : #rendering }
ReadableAdminComponent >> renderCardOn: html [
	readableComponent renderCardOn: html.
	self renderFooterOn: html
]

{ #category : #rendering }
ReadableAdminComponent >> renderFooterOn: html [
	html div
		class: 'card-footer text-right';
		with: [ readable className = 'Advance'
				ifFalse: [ self renderModifyButtonOn: html ].
			self renderRemoveButtonOn: html ]
]

{ #category : #rendering }
ReadableAdminComponent >> renderModifyButtonOn: html [
	html anchor
		class: 'text-primary';
		callback: [ self goToModifyReadable ];
		with: 'Modificar'
]

{ #category : #rendering }
ReadableAdminComponent >> renderRemoveButtonOn: html [
	html
		render:
			(ModalAnchorComponent
				modal: (self removeModalClass with: readable)
				class: 'text-danger ml-3'
				with: 'Borrar')
]
