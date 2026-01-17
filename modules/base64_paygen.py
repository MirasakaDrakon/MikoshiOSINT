import base64

def make_payload():
    print("Press double enter to send encrypt payload")
    print("Enter shell payload:")
    code = ""
    try:
        while True:
            line = input()
            if line.strip() == "":
                break
            code += line + "\n"
    except EOFError:
        pass

    encoded = base64.b64encode(code.encode()).decode()

    print("\n===== PAYLOAD =====\n")
    print(f'echo "{encoded}" | base64 -d | bash')
    print("\n===================\n")

make_payload()
