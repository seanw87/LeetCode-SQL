class Solution:
    def reverseVowels(self, s: str) -> str:
        s = list(s)
        vowels = ['a', 'e', 'i', 'o', 'u']
        start, end = 0, len(s) - 1

        while start < end:
            if s[start].lower() not in vowels:
                start += 1
            elif s[end].lower() not in vowels:
                end -= 1
            else:
                # s[start], s[end] = s[end], s[start]  # Error: 'str' object does not support item assignment
                s[start], s[end] = s[end], s[start]
                start += 1
                end -= 1
        return "".join(s)