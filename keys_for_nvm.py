import argparse

import codecs


def hex_to_base64(hex):
    return codecs.encode(codecs.decode(hex, 'hex'), 'base64').decode()


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
   
    parser.add_argument('--key', help="Encription Key", required=True)
    parser.add_argument('--iv', help="Encription Iv", required=True)

    args = parser.parse_args()

    print("Use for nginx vod module")
    print(f"encryptionKey: {hex_to_base64(args.key)}")
    print(f"encryptionIv: {hex_to_base64(args.iv)}")
