Class {
	#name : #CompleteBookFormulariComponent,
	#superclass : #BookFormulariComponent,
	#category : #'Bookflix-UI'
}

{ #category : #accessing }
CompleteBookFormulariComponent >> author [
	^ self subclassResponsibility
]

{ #category : #accessing }
CompleteBookFormulariComponent >> author: aName [
	^ self subclassResponsibility
]

{ #category : #accessing }
CompleteBookFormulariComponent >> content [
	^ self subclassResponsibility
]

{ #category : #accessing }
CompleteBookFormulariComponent >> content: aContent [
	^ self subclassResponsibility
]

{ #category : #accessing }
CompleteBookFormulariComponent >> description [
	^ self subclassResponsibility
]

{ #category : #accessing }
CompleteBookFormulariComponent >> description: aDescription [
	^ self subclassResponsibility
]

{ #category : #accessing }
CompleteBookFormulariComponent >> editorial [
	^ self subclassResponsibility
]

{ #category : #accessing }
CompleteBookFormulariComponent >> editorial: aName [
	^ self subclassResponsibility
]

{ #category : #accessing }
CompleteBookFormulariComponent >> genders [
	^ self subclassResponsibility
]

{ #category : #accessing }
CompleteBookFormulariComponent >> genders: aGenders [
	^ self subclassResponsibility
]

{ #category : #accessing }
CompleteBookFormulariComponent >> imageURL [
	^ self subclassResponsibility
]

{ #category : #accessing }
CompleteBookFormulariComponent >> imageURL: aImageURL [
	^ self subclassResponsibility
]

{ #category : #accessing }
CompleteBookFormulariComponent >> isbn [
	^ self subclassResponsibility
]

{ #category : #accessing }
CompleteBookFormulariComponent >> isbn: aISBN [
	^ self subclassResponsibility
]

{ #category : #rendering }
CompleteBookFormulariComponent >> renderFormulariContentOn: html [
	html form
		class: 'form-inline';
		with: [ html label
				for: 'input_content';
				with: 'Contenido: '.
			html textInput
				id: 'input_content';
				class: 'form-control';
				on: #content of: self ]
]

{ #category : #rendering }
CompleteBookFormulariComponent >> renderFormulariOn: html [
	html form
		with: [ super renderFormulariOn: html.
			self renderFormulariContentOn: html ]
]

{ #category : #accessing }
CompleteBookFormulariComponent >> title [
	^ self subclassResponsibility
]

{ #category : #accessing }
CompleteBookFormulariComponent >> title: aTitle [
	^ self subclassResponsibility
]
