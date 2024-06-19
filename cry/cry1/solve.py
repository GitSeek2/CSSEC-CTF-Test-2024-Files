key = "1"
res = "rbbtrJ{DBEfPC\dAi~ct_RCHAEX^_L"

decrypted = ""
for i in range(len(res)):
    decrypted += chr(ord(res[i]) ^ ord(key))

print("Decrypted string:", decrypted)

# CSSEC{JustWarmUpXOREncryption}
