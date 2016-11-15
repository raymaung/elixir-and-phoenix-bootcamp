defmodule Cards do

  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for v <- values, s <- suits do
      "#{v} of #{s}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle deck
  end

  def contain?(deck, card) do
    Enum.member? deck, card
  end

  def deal(deck, hand_size) do
    Enum.split deck, hand_size
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary deck
    File.write filename, binary
  end

  def load(filename) do
    {status, content} = File.read(filename)
    case status do
      :ok -> content
      _ -> "Error - Failed to read #{filename}"
    end
  end
end
