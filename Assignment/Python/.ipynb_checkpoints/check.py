import random

numbers = [random.randint(1, 100) for _ in range(10)]
average = sum(numbers) / len(numbers)

print("Numbers:", numbers)
print(f"Average: {average:.2f}")

if average > 50:
    print("Above 50!")
else:
    print("50 or below.")