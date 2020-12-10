# When asking the Nuix API to provide the password used to decrypt that
# item, Nuix has you provide a piece of code that it will invoke.  That
# piece of code is then provided the password as a Java char[]
# (character array).  Your piece of code is then allowed to do whatever
# you wish wit that information.  Whatever your piece of code returns will
# then in turn be returned by the call to revealDecryptionPassword.  In this
# instance we will just be creating a new String containing the password and returning
# that.  For more information on why this is the way it is, there is a nice concise article here:
# https://www.geeksforgeeks.org/use-char-array-string-storing-passwords-java/

# We will store our Proc in a global variable and upon each invocation of
# this field check whether we have already define this or not so that
# we only define it once.
if $password_handler.nil?
	$password_handler = Proc.new { |pass_char_array|
		pass = java.lang.String.new(pass_char_array)
		next pass
	}
end

return $current_item.revealDecryptionPassword($password_handler)