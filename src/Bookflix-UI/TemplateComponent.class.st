"
| application |
application := WAAdmin register: TemplateComponent asApplicationAt: '/main'.
application sessionClass: UserSession.
"
Class {
	#name : #TemplateComponent,
	#superclass : #WABootstrapComponent,
	#instVars : [
		'headComponent',
		'contentComponent'
	],
	#category : #'Bookflix-UI'
}

{ #category : #accessing }
TemplateComponent class >> contentComponent: aContentComponent [
	^ self new contentComponent: aContentComponent
]

{ #category : #seaside }
TemplateComponent >> children [
	^ Array with: headComponent with: contentComponent
]

{ #category : #accessing }
TemplateComponent >> contentComponent: aContentComponent [
	contentComponent := aContentComponent
]

{ #category : #initialization }
TemplateComponent >> initialize [
	headComponent := ProxyNavBarComponent rootComponent: self.
	contentComponent := LoginComponent rootComponent: self
]

{ #category : #rendering }
TemplateComponent >> renderContentOn: html [
	html
		render: headComponent;
		render: contentComponent
]

{ #category : #updating }
TemplateComponent >> updateContentTo: aComponent [
	contentComponent call: aComponent
]

{ #category : #updating }
TemplateComponent >> updateWithContentTo: aComponent [
	self call: (TemplateComponent contentComponent: aComponent)
]
