{-# LANGUAGE FlexibleContexts  #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeOperators     #-}

module Elm.Export.WebSocketSubscriber
  ( renderSubscriber
  ) where

import           Elm.Export.Common
import           Text.PrettyPrint.Leijen.Text

renderSubscriber :: RenderM ()
renderSubscriber = do
  require "WebSocket"
  require "Json.Decode exposing (Decoder, decodeString)"
  require "Result exposing (Result(..))"
  collectDeclaration . return $
    "listen : String -> Decoder a -> (Result String a -> msg) -> Sub msg" <$$> "listen url decoder tagger = " <$$>
    "    WebSocket.listen url (\\str -> decodeString decoder str |> tagger)"