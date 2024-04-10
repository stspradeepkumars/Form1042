from faker import Faker

class RandomNameGenerator:
    def __init__(self):
        self.faker = Faker()

    def generate_first_name(self):
        first_name = self.faker.name()
        return first_name

# Create an instance of RandomNameGenerator
Generator = RandomNameGenerator()

# Call the generate_first_name method
first_name = Generator.generate_first_name()