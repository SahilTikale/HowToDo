
def string2range(dash_sep_string):
    answer = []
    new_list = dash_sep_string.split('-')
    start = int(new_list[0])
    end = int(new_list[1])
    middle = start
    answer = []
    while middle <= end:
        answer.append(middle)
        middle += 1
    return answer


input_string = '[109,117,120-121,135-137,140,146-156,165-171,173,176-182,184-185,187-191,207,216,218]'

new_input = input_string.strip('[').strip(']')
input_list = new_input.split(',')
final_list = []

for i in input_list:
    if "-" not in i:
        x = int(i)
        final_list.append(x)
    else:
        x = string2range(i)
        final_list.extend(x)
final_list.sort()
print(final_list)
