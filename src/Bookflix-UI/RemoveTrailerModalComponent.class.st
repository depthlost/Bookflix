Class {
	#name : #RemoveTrailerModalComponent,
	#superclass : #RemoveReadableModalComponent,
	#category : #'Bookflix-UI-readables'
}

{ #category : #callbacks }
RemoveTrailerModalComponent >> removeReadable [
	Bookflix instance removeAdvance: readable
]
