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

{ #category : #initialization }
TemplateComponent >> initialize [
	contentComponent := LoginComponent in: self.
	navbarComponent := ProxyNavBarComponent
		withContentComponent: contentComponent
]

{ #category : #update }
TemplateComponent >> loadSessionState [
	contentComponent := HomeComponent new.
	navbarComponent := ProxyNavBarComponent
		withContentComponent: contentComponent
]

{ #category : #rendering }
TemplateComponent >> renderContentOn: html [
	html
		render: navbarComponent;
		render: contentComponent
]
