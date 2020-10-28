//
//  HeroesModel.swift
//  DotaHeroes
//
//  Created by Haidar Ammarafif Ramzy on 24/10/20.
//

import Foundation

struct HeroesModel: Codable {
    let id: Int
    let name, localized_name, primary_attr, attack_type, img, icon: String
    let roles: [String]
    let base_health, base_health_regen, base_mana, base_mana_regen, base_armor, base_mr,
        base_attack_min, base_attack_max, base_str, base_agi, base_int, str_gain, agi_gain,
        int_gain, attack_range, projectile_speed, attack_rate, move_speed, turn_rate, legs,
        pro_ban, hero_id, pro_win, pro_pick, first_pick, first_win, second_pick, second_win,
        third_pick, third_win, fourth_pick, fourth_win, fifth_pick, fifth_win, sixth_pick,
        sixth_win, seventh_pick, seventh_win, eight_pick, eight_win, null_pick, null_win: Float?
    let cm_enabled: Bool
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case localized_name = "localized_name"
        case primary_attr = "primary_attr"
        case attack_type = "attack_type"
        case img = "img"
        case icon = "icon"
        case roles = "roles"
        case base_health = "base_health"
        case base_health_regen = "base_health_regen"
        case base_mana = "base_mana"
        case base_mana_regen = "base_mana_regen"
        case base_armor = "base_armor"
        case base_mr = "base_mr"
        case base_attack_min = "base_attack_min"
        case base_attack_max = "base_attack_max"
        case base_str = "base_str"
        case base_agi = "base_agi"
        case base_int = "base_int"
        case str_gain = "str_gain"
        case agi_gain = "agi_gain"
        case int_gain = "int_gain"
        case attack_range = "attack_range"
        case projectile_speed = "projectile_speed"
        case attack_rate = "attack_rate"
        case move_speed = "move_speed"
        case turn_rate = "turn_rate"
        case legs = "legs"
        case pro_ban = "pro_ban"
        case hero_id = "hero_id"
        case pro_win = "pro_win"
        case pro_pick = "pro_pick"
        case first_pick = "1_pick"
        case first_win = "1_win"
        case second_pick = "2_pick"
        case second_win = "2_win"
        case third_pick = "3_pick"
        case third_win = "3_win"
        case fourth_pick = "4_pick"
        case fourth_win = "4_win"
        case fifth_pick = "5_pick"
        case fifth_win = "5_win"
        case sixth_pick = "6_pick"
        case sixth_win = "6_win"
        case seventh_pick = "7_pick"
        case seventh_win = "7_win"
        case eight_pick = "8_pick"
        case eight_win = "8_win"
        case null_pick = "null_pick"
        case null_win = "null_win"
        case cm_enabled = "cm_enabled"
    }
}
