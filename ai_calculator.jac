import re

walker Calculator:
    has input_str: str
    has result: float

    can parse_expression():
        # Try to directly evaluate as a math expression
        try:
            self.result = eval(self.input_str)
            return True
        except:
            return False

    can ai_parse():
        # Map English words to operators
        ops = {
            "plus": "+",
            "add": "+",
            "minus": "-",
            "subtract": "-",
            "times": "*",
            "multiply": "*",
            "x": "*",
            "divided by": "/",
            "divide": "/"
        }
        # Lowercase for easy matching
        query = self.input_str.lower()
        # Replace English operators with symbols
        for word, op in ops.items():
            query = query.replace(word, f" {op} ")
        # Remove non-number/non-operator words
        query = re.sub(r'[^0-9\+\-\*/\. ]', '', query)
        try:
            self.result = eval(query)
            return True
        except:
            return False

    can run():
        if self.parse_expression():
            print(f"Result: {self.result}")
        elif self.ai_parse():
            print(f"AI Parsed Result: {self.result}")
        else:
            print("Sorry, I couldn't understand your input.")

init:
    input_str = input("Enter calculation (e.g., '5+3' or 'What is 5 plus 3?'): ")
    Calculator(input_str=input_str).run()