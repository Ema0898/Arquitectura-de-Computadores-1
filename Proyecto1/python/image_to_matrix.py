from PIL import Image

f= open("image.txt","w+")

img = Image.open('image.png').convert('L')  # convert image to 8-bit grayscale
WIDTH, HEIGHT = img.size

data = list(img.getdata()) # convert image data to a list of integers
# convert that to 2D list (list of lists of integers)
data = [data[offset:offset+WIDTH] for offset in range(0, WIDTH*HEIGHT, WIDTH)]

# At this point the image's pixels are all in memory and can be accessed
# individually using data[row][col].


f.write("'{\n")
for i in range(360,480):
    f.write("'{")
    for j in range(640):
        if j != 639:
            f.write("8'b"+format(data[i][j],'08b')+"," +' ')
        else:
            f.write("8'b"+format(data[i][j],'08b'))
    f.write("},\n")
f.write("}")

f.close() 




