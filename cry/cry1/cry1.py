# key 和 flag 的内容需要你自己解出
from key import key
from flag import flag


def xor_encrypt(flag, key):
    encrypted_string = ""

    for i in range(len(flag)):
        encrypted_string += chr(ord(flag[i]) ^ ord(key))

    return encrypted_string


if __name__ == "__main__":
    encrypted_string = xor_encrypt(flag, key)
    print("Encrypted String:", encrypted_string)

    # 输出内容
    """
    Encrypted String: rbbtrJ{DBEfPC\dAi~ct_RCHAEX^_L
    """
