import getpass
import hashlib

s_user = "nwoik"
s_pin  = "03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4"

def hash_string(message:str):
    return hashlib.sha256(message.encode("UTF-8")).hexdigest()


def login(user, pin):
    if user == s_user and s_pin == hash_string(pin):
        print("user/PIN : " + user + "/" + pin)
        return True
    return False


def main():
    user = input("user: ")
    pin = getpass.getpass("PIN :")
    if login(user, pin):
        print("access granted")

    else :
        print("access denied")