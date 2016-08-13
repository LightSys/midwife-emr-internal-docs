module Verbage exposing (..)


learnIntro : List ( String, Maybe String )
learnIntro =
    [ ( """

        Midwife-EMR is software that is specifically made for midwives in order
        to help them manage their patient's medical records. Midwife-EMR is
        designed for the full breadth of pregnancy care from prenatal through
        labor/delivery and postpartum.

        """
      , Nothing
      )
    , ( """

        Midwife-EMR is free, open-source software that is able to run on a number
        of different computer devices including a small appliance like this
        Odroid or a laptop/desktop. But since Midwife-EMR is a browser
        application, that means that midwives can use the application on
        everything from their computers to their phones or tablets.

        """
      , Just "src/assets/IMG_7206_cropped_96x96.JPG"
      )
    ]
