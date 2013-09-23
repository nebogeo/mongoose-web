;; Starwisp Copyright (C) 2013 Dave Griffiths
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU Affero General Public License as
;; published by the Free Software Foundation, either version 3 of the
;; License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU Affero General Public License for more details.
;;
;; You should have received a copy of the GNU Affero General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(define-activity-list
  (activity
   "splash"
   (vert
    (text-view (make-id "splash-title") "Mongoose 2000" 40 fillwrap)
    (text-view (make-id "splash-about") "Advanced mongoose technology" 20 fillwrap)
    (spacer 20)
    (button (make-id "f2") "Get started!" 20 fillwrap
            (lambda () (list (start-activity-goto "main" 2 "")))))
   (lambda (activity arg)
     (activity-layout activity))
   (lambda (activity arg) '())
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity requestcode resultcode) '()))


  (activity
   "main"
   (vert
    (text-view (make-id "main-title") "Mongoose 2000" 40 fillwrap)
    (text-view (make-id "main-about") "Advanced mongoose technology" 20 fillwrap)
    (spacer 10)
    (button (make-id "main-sync") "Experiments" 20 fillwrap (lambda () (list (start-activity "experiments" 2 ""))))
    (button (make-id "main-sync") "Manage Packs" 20 fillwrap (lambda () (list (start-activity "manage-packs" 2 ""))))
    (button (make-id "main-sync") "Tag Location" 20 fillwrap (lambda () (list)))
    (button (make-id "main-sync") "Send Database" 20 fillwrap (lambda () (list)))
    (button (make-id "main-sync") "Sync Data" 20 fillwrap (lambda () (list)))
    )
   (lambda (activity arg)
     (activity-layout activity))
   (lambda (activity arg) (list))
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity requestcode resultcode) '()))

  (activity
   "experiments"
   (vert
    (text-view (make-id "title") "Experiments" 40 fillwrap)
    (spacer 10)
    (button (make-id "main-sync") "Pup Focal" 20 fillwrap (lambda () (list (start-activity "pack-select" 2 ""))))
    )
   (lambda (activity arg)
     (activity-layout activity))
   (lambda (activity arg) (list))
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity requestcode resultcode) '()))

  (activity
   "pack-select"
   (vert
    (text-view (make-id "title") "Select a Pack" 40 fillwrap)
    (spacer 10)
    (horiz
     (button (make-id "pack-select-pack-0") "Pack 1" 20 fillwrap (lambda () (list (start-activity "individual-select" 2 ""))))
     (button (make-id "pack-select-pack-1") "Pack 2" 20 fillwrap (lambda () (list (start-activity "individual-select" 2 "")))))
    (horiz
     (button (make-id "pack-select-pack-2") "Pack 3" 20 fillwrap (lambda () (list (start-activity "individual-select" 2 ""))))
     (button (make-id "pack-select-pack-3") "Pack 4" 20 fillwrap (lambda () (list (start-activity "individual-select" 2 "")))))
    (horiz
     (button (make-id "pack-select-pack-4") "Pack 5" 20 fillwrap (lambda () (list (start-activity "individual-select" 2 ""))))
     (button (make-id "pack-select-pack-5") "Pack 6" 20 fillwrap (lambda () (list (start-activity "individual-select" 2 "")))))
    )

   (lambda (activity arg)
     (activity-layout activity))
   (lambda (activity arg) (list))
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity requestcode resultcode) '()))

  (activity
   "individual-select"
   (vert
    (text-view (make-id "title") "Select an individual" 40 fillwrap)
    (spacer 10)
    (horiz
     (button (make-id "individual-select-pack-0") "Mongoose 1" 20 fillwrap (lambda () (list (start-activity "pup-focal" 2 ""))))
     (button (make-id "individual-select-pack-1") "Mongoose 2" 20 fillwrap (lambda () (list (start-activity "pup-focal" 2 "")))))
    (horiz
     (button (make-id "individual-select-pack-2") "Mongoose 3" 20 fillwrap (lambda () (list (start-activity "pup-focal" 2 ""))))
     (button (make-id "individual-select-pack-3") "Mongoose 4" 20 fillwrap (lambda () (list (start-activity "pup-focal" 2 "")))))
    (horiz
     (button (make-id "individual-select-pack-4") "Mongoose 5" 20 fillwrap (lambda () (list (start-activity "pup-focal" 2 ""))))
     (button (make-id "individual-select-pack-5") "Mongoose 6" 20 fillwrap (lambda () (list (start-activity "pup-focal" 2 "")))))
    )
   (lambda (activity arg)
     (activity-layout activity))
   (lambda (activity arg) (list))
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity requestcode resultcode) '()))


  (activity
   "pup-focal"
   (vert
    (horiz
     (text-view (make-id "pup-focal-title") "Pup Focal" 40 fillwrap)
     (vert
      (text-view (make-id "pup-focal-timer-text") "Time left" 20 fillwrap)
      (text-view (make-id "pup-focal-timer") "30" 40 fillwrap)))
    (spacer 10)
    (text-view (make-id "pup-focal") "Current Activity" 20 fillwrap)
    (horiz
     (toggle-button (make-id "pup-focal-moving") "Moving" 30 fillwrap (lambda (v) '()))
     (toggle-button (make-id "pup-focal-foraging") "Foraging" 30 fillwrap (lambda (v) '()))
     (toggle-button (make-id "pup-focal-resting") "Resting" 30 fillwrap (lambda (v) '())))
    (spacer 10)
    (text-view (make-id "pup-focal-escort-text") "Current Escort" 20 fillwrap)
    (spinner (make-id "pup-focal-escort") (list "Mongoose 1" "Mongoose 2" "Mongoose 3" "Mongoose 4") fillwrap (lambda (v) '()))
    (spacer 10)
    (horiz
     (button (make-id "pup-focal-event") "New event" 20 fillwrap (lambda () (list (start-activity "pup-focal-event" 2 ""))))
     (toggle-button (make-id "pup-focal-pause") "Pause" 20 fillwrap (lambda (v) '()))
     ))

   (lambda (activity arg)
     (activity-layout activity))
   (lambda (activity arg) (list))
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity requestcode resultcode) '()))

  (activity
   "pup-focal-event"
   (vert
    (text-view (make-id "main-title") "Pup focal event" 40 fillwrap)
    (spacer 10)
    (button (make-id "event-self") "Self feeding" 20 fillwrap
            (lambda () (list (start-activity "event-self" 2 ""))))
    (button (make-id "event-fed") "Being fed" 20 fillwrap
            (lambda () (list (start-activity "event-fed" 2 ""))))
    (button (make-id "event-aggression") "Aggression" 20 fillwrap
            (lambda () (list (start-activity "event-aggression" 2 ""))))
    (spacer 10)
    (button (make-id "event-cancel") "Cancel" 20 fillwrap
            (lambda () (list (finish-activity 0))))
    )
   (lambda (activity arg)
     (activity-layout activity))
   (lambda (activity arg) (list))
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity requestcode resultcode) '()))

  (activity
   "event-self"
   (vert
    (text-view (make-id "main-title") "Pup focal self feeding" 40 fillwrap)
    (spacer 10)
    (toggle-button (make-id "event-self-found") "Found item?" 20 fillwrap
                   (lambda (v) '()))
    (toggle-button (make-id "event-self-kept") "Kept item?" 20 fillwrap
                   (lambda (v) '()))

    (text-view (make-id "event-self-type-text") "Food type" 20 fillwrap)
    (spinner (make-id "event-self-type") (list "Beetle" "Millipede") fillwrap (lambda (v) '()))

    (text-view (make-id "event-self-type-text") "Food size" 20 fillwrap)
    (spinner (make-id "event-self-type") (list "Small" "Medium" "Large") fillwrap (lambda (v) '()))
    (spacer 10)
    (horiz
     (button (make-id "event-self-cancel") "Cancel" 20 fillwrap (lambda () (list (finish-activity 0))))
     (button (make-id "event-self-done") "Done" 20 fillwrap (lambda () (list (finish-activity 0)))))
    )
   (lambda (activity arg)
     (activity-layout activity))
   (lambda (activity arg) (list))
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity requestcode resultcode) '()))

  (activity
   "event-fed"
   (vert
    (text-view (make-id "main-title") "Pup focal being fed" 40 fillwrap)
    (spacer 10)
    (text-view (make-id "event-fed-who-text") "Who by" 20 fillwrap)
    (spinner (make-id "event-fed-who") (list "Mongoose 1" "Mongoose 2" "Mongoose 3") fillwrap (lambda (v) '()))
    (toggle-button (make-id "event-fed-closest") "Closest to feeder?" 20 fillwrap
                   (lambda (v) '()))

    (text-view (make-id "event-self-type-text") "Who moved?" 20 fillwrap)
    (spinner (make-id "event-self-type") (list "Pup" "Feeder") fillwrap (lambda (v) '()))

    (text-view (make-id "event-fed-type-text") "Food type" 20 fillwrap)
    (spinner (make-id "event-fed-type") (list "Beetle" "Millipede") fillwrap (lambda (v) '()))

    (text-view (make-id "event-fed-type-text") "Food size" 20 fillwrap)
    (spinner (make-id "event-fed-type") (list "Small" "Medium" "Large") fillwrap (lambda (v) '()))
    (spacer 10)
    (horiz
     (button (make-id "event-fed-cancel") "Cancel" 20 fillwrap (lambda () (list (finish-activity 0))))
     (button (make-id "event-fed-done") "Done" 20 fillwrap (lambda () (list (finish-activity 0)))))
    )
   (lambda (activity arg)
     (activity-layout activity))
   (lambda (activity arg) (list))
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity requestcode resultcode) '()))

  (activity
   "event-aggression"
   (vert
    (text-view (make-id "main-title") "Pup focal agression" 40 fillwrap)
    (spacer 10)
    (text-view (make-id "event-agg-who-text") "Other individual" 20 fillwrap)
    (spinner (make-id "event-agg-who") (list "Mongoose 1" "Mongoose 2" "Mongoose 3") fillwrap (lambda (v) '()))
    (text-view (make-id "event-agg-severity-text") "Severity" 20 fillwrap)
    (seek-bar (make-id "event-agg-severity") 100 fillwrap (lambda (v) '()))
    (spacer 10)
    (horiz
     (button (make-id "event-agg-cancel") "Cancel" 20 fillwrap (lambda () (list (finish-activity 0))))
     (button (make-id "event-agg-done") "Done" 20 fillwrap (lambda () (list (finish-activity 0)))))
    )
   (lambda (activity arg)
     (activity-layout activity))
   (lambda (activity arg) (list))
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity requestcode resultcode) '()))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


  (activity
   "manage-packs"
   (vert
    (text-view (make-id "title") "Manage packs" 40 fillwrap)
    (spacer 10)
    (horiz
     (button (make-id "manage-packs-pack-0") "Pack 1" 20 fillwrap (lambda () (list (start-activity "manage-individuals" 2 ""))))
     (button (make-id "manage-packs-pack-1") "Pack 2" 20 fillwrap (lambda () (list (start-activity "manage-individuals" 2 "")))))
    (horiz
     (button (make-id "manage-packs-pack-2") "Pack 3" 20 fillwrap (lambda () (list (start-activity "manage-individuals" 2 ""))))
     (button (make-id "manage-packs-pack-3") "Pack 4" 20 fillwrap (lambda () (list (start-activity "manage-individuals" 2 "")))))
    (horiz
     (button (make-id "manage-packs-pack-4") "Pack 5" 20 fillwrap (lambda () (list (start-activity "manage-individuals" 2 ""))))
     (button (make-id "manage-packs-pack-5") "Pack 6" 20 fillwrap (lambda () (list (start-activity "manage-individuals" 2 "")))))

    (button (make-id "manage-packs-new") "New pack" 30 fillwrap (lambda () (list (start-activity "new-pack" 2 ""))))
    )

   (lambda (activity arg)
     (activity-layout activity))
   (lambda (activity arg) (list))
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity requestcode resultcode) '()))

  (activity
   "new-pack"
   (vert
    (text-view (make-id "title") "New pack" 40 fillwrap)
    (spacer 10)
    (text-view (make-id "new-pack-name-text") "Pack name")
    (edit-text (make-id "new-pack-name") "" 30 fillwrap (lambda (v) '()))
    (spacer 10)
    (button (make-id "new-pack-done") "Done" 30 fillwrap (lambda () (list (finish-activity 2))))
    )
   (lambda (activity arg)
     (activity-layout activity))
   (lambda (activity arg) (list))
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity requestcode resultcode) '()))


  (activity
   "manage-individuals"
   (vert
    (text-view (make-id "title") "Manage individuals" 40 fillwrap)
    (spacer 10)

    (horiz
     (button (make-id "manage-individuals-0") "Mongoose 1" 20 fillwrap (lambda () (list (start-activity "pup-focal" 2 ""))))
     (button (make-id "manage-individuals-1") "Mongoose 2" 20 fillwrap (lambda () (list (start-activity "pup-focal" 2 "")))))
    (horiz
     (button (make-id "manage-individuals-2") "Mongoose 3" 20 fillwrap (lambda () (list (start-activity "pup-focal" 2 ""))))
     (button (make-id "manage-individuals-3") "Mongoose 4" 20 fillwrap (lambda () (list (start-activity "pup-focal" 2 "")))))
    (horiz
     (button (make-id "manage-individuals-4") "Mongoose 5" 20 fillwrap (lambda () (list (start-activity "pup-focal" 2 ""))))
     (button (make-id "manage-individuals-5") "Mongoose 6" 20 fillwrap (lambda () (list (start-activity "pup-focal" 2 "")))))

    (button (make-id "manage-individuals-new") "New individual" 30 fillwrap (lambda () (list (start-activity "new-individual" 2 ""))))
    )

   (lambda (activity arg)
     (activity-layout activity))
   (lambda (activity arg) (list))
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity requestcode resultcode) '()))

  (activity
   "new-individual"
   (vert
    (text-view (make-id "title") "New Mongoose" 40 fillwrap)
    (spacer 10)
    (text-view (make-id "new-individual-name-text") "Name")
    (edit-text (make-id "new-individual-name") "" 30 fillwrap (lambda (v) '()))
    (text-view (make-id "new-individual-name-text") "Gender")
    (spinner (make-id "new-individual-gender") (list "Female" "Male") fillwrap (lambda (v) '()))
    (text-view (make-id "new-individual-dob-text") "Date of Birth")
    (horiz
     (text-view (make-id "new-individual-dob") "00/00/00" 25 fillwrap)
     (button (make-id "date") "Set date" 20 fillwrap (lambda () '())))
    (text-view (make-id "new-individual-litter-text") "Litter code")
    (edit-text (make-id "new-individual-litter-code") "" 30 fillwrap (lambda (v) '()))
    (text-view (make-id "new-individual-chip-text") "Chip code")
    (edit-text (make-id "new-individual-chip-code") "" 30 fillwrap (lambda (v) '()))
    (spacer 10)
    (button (make-id "new-individual-done") "Done" 30 fillwrap (lambda () (list (finish-activity 2))))
    )
   (lambda (activity arg)
     (activity-layout activity))
   (lambda (activity arg) (list))
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity requestcode resultcode) '()))

  (activity
   "update-individual"
   (vert
    (text-view (make-id "title") "Update Mongoose" 40 fillwrap)
    (spacer 10)
    (text-view (make-id "update-individual-name-text") "Name")
    (edit-text (make-id "update-individual-name") "" 30 fillwrap (lambda (v) '()))
    (text-view (make-id "update-individual-name-text") "Gender")
    (spinner (make-id "update-individual-gender") (list "Female" "Male") fillwrap (lambda (v) '()))
    (text-view (make-id "update-individual-dob-text") "Date of Birth")
    (horiz
     (text-view (make-id "update-individual-dob") "00/00/00" 25 fillwrap)
     (button (make-id "date") "Set date" 20 fillwrap (lambda () '())))
    (text-view (make-id "update-individual-litter-text") "Litter code")
    (edit-text (make-id "update-individual-litter-code") "" 30 fillwrap (lambda (v) '()))
    (text-view (make-id "update-individual-chip-text") "Chip code")
    (edit-text (make-id "update-individual-chip-code") "" 30 fillwrap (lambda (v) '()))
    (spacer 10)
    (horiz
     (button (make-id "update-individual-delete") "Delete" 30 fillwrap (lambda () (list (finish-activity 2))))
     (button (make-id "update-individual-died") "Died" 30 fillwrap (lambda () (list (finish-activity 2)))))
    (horiz
     (button (make-id "update-individual-cancel") "Cancel" 30 fillwrap (lambda () (list (finish-activity 2))))
     (button (make-id "update-individual-done") "Done" 30 fillwrap (lambda () (list (finish-activity 2)))))
    )
   (lambda (activity arg)
     (activity-layout activity))
   (lambda (activity arg) (list))
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity requestcode resultcode) '()))


  (activity
   "tag-location"
   (vert
    (text-view (make-id "title") "Tag Location" 40 fillwrap)
    (spacer 10)
    (text-view (make-id "tag-location-gps-text") "GPS")
    (horiz
     (text-view (make-id "tag-location-gps-lat") "LAT")
     (text-view (make-id "tag-location-gps-lng") "LNG"))

    (text-view (make-id "tag-location-name-text") "Name")
    (edit-text (make-id "tag-location-name") "" 30 fillwrap (lambda (v) '()))

    (text-view (make-id "tag-location-pack-text") "Associated pack")
    (spinner (make-id "tag-location-pack") (list "Pack 1" "Pack 2") fillwrap (lambda (v) '()))

    (text-view (make-id "tag-location-radius-text") "Approx radius of area" 20 fillwrap)
    (seek-bar (make-id "tag-location-radius") 100 fillwrap (lambda (v) '()))
    (text-view (make-id "tag-location-radius-value") "10m" 20 fillwrap)

    (horiz
     (button (make-id "tag-location-cancel") "Cancel" 30 fillwrap (lambda () (list (finish-activity 2))))
     (button (make-id "tag-location-done") "Done" 30 fillwrap (lambda () (list (finish-activity 2)))))

    )
   (lambda (activity arg)
     (activity-layout activity))
   (lambda (activity arg) (list))
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity) '())
   (lambda (activity requestcode resultcode) '()))




  )
