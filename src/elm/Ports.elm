port module Ports exposing (..)

{-| We use JS to do the actual scrolling due to needing to scroll a parent element
    created by MDL that does not have an id, which means that the Elm libraries
    won't touch it. This will scroll the parent of the element passed (via id) to
    the top of the screen.
-}

-- PORTS


port scrollParent : String -> Cmd msg
