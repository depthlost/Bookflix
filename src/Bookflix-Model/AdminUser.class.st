Class {
	#name : #AdminUser,
	#superclass : #User,
	#category : #'Bookflix-Model'
}

{ #category : #testing }
AdminUser >> canAddProfile [
	^ false
]

{ #category : #abstract }
AdminUser >> isAdmin [
	^ true
]

{ #category : #accessing }
AdminUser >> registrationDate [
	^ '1/1/1110' asDate
]
