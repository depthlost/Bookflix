"
| application |
application := WAAdmin register: TemplateComponent asApplicationAt: '/main'.
application sessionClass: UserSession.
"
Class {
	#name : #TemplateComponent,
	#superclass : #WABootstrapComponent,
	#instVars : [
		'contentComponent',
		'navbarComponent'
	],
	#category : #'Bookflix-UI-others'
}

{ #category : #seaside }
TemplateComponent >> children [
	^ Array with: navbarComponent with: contentComponent
]

{ #category : #accessing }
TemplateComponent >> content [
	^ contentComponent
]

{ #category : #accessing }
TemplateComponent >> content: aComponent [
	contentComponent := aComponent
]

{ #category : #initialization }
TemplateComponent >> initialize [
	super initialize.
	self session mainComponent: self.
	contentComponent := LoginComponent new.
	navbarComponent := ProxyNavBarComponent new
]

{ #category : #accessing }
TemplateComponent >> navbar [
	^ navbarComponent
]

{ #category : #accessing }
TemplateComponent >> navbar: aComponent [
	navbarComponent := aComponent
]

{ #category : #rendering }
TemplateComponent >> renderContentOn: html [
	html
		render: navbarComponent;
		render: contentComponent
]
