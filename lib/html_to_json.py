import re
import json
def main(filename):
    members = []
    try:
        with open(filename, 'r') as f:
            div_start=0
            # i=0
            for line in f.readlines():
                # print(i)
                # i+=1
                if '<div class="member">' in line:
                    div_start=1
                elif div_start == 3:
                    img = re.search(r'http.*g', line)
                    if img is None:
                        img = ''
                    else:
                        img = img.group()
                elif div_start == 10:
                    name = line.replace('</a>', '').strip()
                if div_start>0:
                    div_start+=1
                if div_start == 11:
                    div_start = 0
                    members.append({'name': name, 'img': img})
        json_str = json.dumps(members)
                # print(line)
    except Exception as e:
        print(e)
    try:
        with open('ingles.json', 'w') as f:
            f.write(json_str)
    except Exception as e:
        print(e)

# if __name__ == ' __main__':
main('/Users/macbook/Flutter/yachay_app/yachay_app/lib/ingles.html')