require "minitest/autorun"
require_relative "hangman.rb"

class Testhangmanfunctions < Minitest::Test

	def test_class_returns_upcase_word
		hangman = Hangman.new("HaNgMaN")
		assert_equal("HANGMAN",hangman.name)
	end
	def test_class_returns_name
		hangman = Hangman.new("cody")
		assert_equal(4,hangman.charcount)
	end

	def test_class_returns_six_blank
		hangman = Hangman.new("dakota")
		assert_equal(["_","_","_","_","_","_"],hangman.blank)
	end
	def test_class_if_included_in_password
		hangman = Hangman.new("dakota")
		letter = "O"
		assert_equal(true,hangman.correct_letter?(letter))
	end
	def test_class_user_guess_is_pushed_into_guessing_array
		hangman = Hangman.new("dakota")
		hangman.guessed = ["s","r","b"]
		letter = "y"
		assert_equal(["s","r","b","y"],hangman.update_guessed(letter))
	end
	def test_returns_correct_index_positions
		hangman = Hangman.new("dakota")
		letter = "D"
		hangman.correct_index(letter)
		assert_equal(["D","_","_","_","_","_"],hangman.correct_blank)
	end
	def test_returns_correct_position
		hangman = Hangman.new("dakota")
		hangman.correct_blank = ["D","_","_","_","_","_"]
		letter = "K"
		hangman.correct_index(letter)
		assert_equal(["D","_","K","_","_","_"],hangman.correct_blank)
	end
	def test_correct_blank_array_stays_the_same_after_invalid_guess
		hangman = Hangman.new("hangman")
		letter = "f"
		hangman.correct_index(letter)
		assert_equal(["_","_","_","_","_","_","_"],hangman.correct_blank)
	end
	def test_correct_blank_array_stays_the_same_after_invalid_guess1
		hangman = Hangman.new("hangman")
		letter = "H"
		hangman.correct_index(letter)
		assert_equal(["H","_","_","_","_","_","_"],hangman.correct_blank)
	end
	def test_see_if_guess_is_guessed
		hangman = Hangman.new("hangman")
		hangman.guessed = ["o","h","k"]
		letter = "H"
		assert_equal(false,hangman.available_guessed(letter))
	end
	def test_see_if_guess_is_guessed
		hangman = Hangman.new("hangman")
		hangman.guessed = ["o","h","k"]
		letter = "G"
		assert_equal(true,hangman.available_guessed(letter))
		
	end
	def test_valid_letter
		hangman = Hangman.new("hangman")
		letter = "A"
		assert_equal(true,hangman.correct_letter?(letter))
	end
	def test_invalid_letter
		hangman = Hangman.new("hangman")
		letter = "L"
		assert_equal(false,hangman.correct_letter?(letter))
	end
	

end