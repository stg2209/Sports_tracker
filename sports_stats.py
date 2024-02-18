import requests

API_KEY = "12457496b72249c29dd458fe11268b2a"  # Replace with your actual API key
TEAM_ID = 5  # Replace with the team ID
#https://api.football-data.org/v4/competitions
url = f"https://api.football-data.org/v4/competitions/2002/teams"
#url=f"https://api.football-data.org/v4/person/8004"
headers = {"X-Auth-Token": API_KEY}
params = {"season": 2023}  # Optional: filter by season

response = requests.get(url, headers=headers, params=params)

if response.status_code == 200:
    matches = response.json()
    # Process the matches data here
    #print(matches['teams'][0]['name'], matches['teams'][1]['name'])
    #for i in range(18):

    print(matches['teams'][4]['name'])
else:
    print(f"Error: {response.status_code}")

# import requests

# API_KEY = "12457496b72249c29dd458fe11268b2a"  # Replace with your actual API key

# TEAM_ID = 5  # Bayern Munich team ID
# SEASON = 2022

# url = f"https://api.football-data.org/v2/teams/{TEAM_ID}/matches"
# headers = {"X-Auth-Token": API_KEY}
# params = {
#     "season": SEASON,
#     "competition_code": "BL1",  # Bundesliga code
# }

# response = requests.get(url, headers=headers, params=params)

# if response.status_code == 200:
#     matches = response.json()
#     total_goals = 0
#     for match in matches:
#         if match["homeTeam"]["id"] == TEAM_ID:
#             total_goals += match["score"]["goalsHome"]
#         elif match["awayTeam"]["id"] == TEAM_ID:
#             total_goals += match["score"]["goalsAway"]

#     print(f"Total goals scored by Bayern Munich in Bundesliga {SEASON}: {total_goals}")
# else:
#     print(f"Error: {response.status_code}")
