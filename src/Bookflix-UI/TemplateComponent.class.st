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
	headComponent := ProxyNavBarComponent new
]

{ #category : #rendering }
TemplateComponent >> renderContentOn: html [
	html
		render: headComponent;
		render: contentComponent
]
