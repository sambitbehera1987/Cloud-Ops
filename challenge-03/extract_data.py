key_separator = "/"


def extract(input_object, key):
    key_list = key.split(key_separator)
    for i in range(0, len(key_list)):
        value = key_list[i]

        if input_object is None:
            return None

        input_object = input_object.get(value)
    return input_object
