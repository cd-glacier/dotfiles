#include QMK_KEYBOARD_H
#include "debug.h"
#include "action_layer.h"
#include "version.h"

extern keymap_config_t keymap_config;

// Each layer gets a name for readability, which is then used in the keymap matrix below.
// The underscores don't mean anything - you can have a layer called STUFF or any other name.
// Layer names don't all need to be of the same length, obviously, and you can also skip them
// entirely and just use numbers.
#define _QWERTY 0
#define _LOWER 3
#define _RAISE 4
#define _ADJUST 16

enum custom_keycodes {
  QWERTY = SAFE_RANGE,
  LOWER,
  RAISE,
  ADJUST,
};

//Tap Dance Declarations
enum {
  TD_LBRACKET = 0,
  TD_RBRACKET,
  TD_MINUS,
  TD_PLUS 
};

//Tap Dance Definitions
qk_tap_dance_action_t tap_dance_actions[] = {
  //Tap once for Esc, twice for Caps Lock
  [TD_LBRACKET] = ACTION_TAP_DANCE_DOUBLE (KC_LPRN, KC_LBRC),
  [TD_RBRACKET] = ACTION_TAP_DANCE_DOUBLE (KC_RPRN, KC_RBRC),
  [TD_CBRACKET] = ACTION_DANCE_DOUBLE (KC_LCBR, KC_RBRC), 
  [TD_MINUS] = ACTION_TAP_DANCE_DOUBLE (KC_MINS, KC_UNDS),
  [TD_PLUS] = ACTION_TAP_DANCE_DOUBLE (KC_EQL, KC_PLUS)
};

// Fillers to make layering more clear
#define _______ KC_TRNS
#define XXXXXXX KC_NO

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
/* Qwerty
 * ,-----------------------------------------------------------------------------------.
 * | Tab  |   Q  |   W  |   E  |   R  |   T  |   Y  |   U  |   I  |   O  |   P  | Bksp |
 * |------+------+------+------+------+-------------+------+------+------+------+------|
 * | Ctrl |   A  |   S  |   D  |   F  |   G  |   H  |   J  |   K  |   L  |   ;  |  "   |
 * |------+------+------+------+------+------|------+------+------+------+------+------|
 * | Shift|   Z  |   X  |   C  |   V  |   B  |   N  |   M  |   ,  |   .  |   /  | - _  |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * | Esc  |   _  | Alt  | GUI  |Lower |Space |Enter |Raise | GUI  | Alt  | {  } | = +  |
 * `-----------------------------------------------------------------------------------'
 */
[_QWERTY] = LAYOUT_ortho_4x12(
   KC_TAB,  KC_Q,     KC_W,    KC_E,    KC_R,    KC_T,    KC_Y,    KC_U,    KC_I,    KC_O,    KC_P,             KC_BSPC, \
   KC_LCTL, KC_A,     KC_S,    KC_D,    KC_F,    KC_G,    KC_H,    KC_J,    KC_K,    KC_L,    KC_SCLN,          KC_QUOT, \
   KC_LSFT, KC_Z,     KC_X,    KC_C,    KC_V,    KC_B,    KC_N,    KC_M,    KC_COMM, KC_DOT,  KC_SLSH,          TD(TD_MINUS), \
   KC_ESC,  KC_UNDS,  KC_LALT, KC_LGUI, LOWER,   KC_SPC,  KC_ENT,  RAISE,   KC_RGUI, KC_RALT, TD(TD_CBRACKET),  TD(TD_PLUS)\
),

/* Lower
 * ,-----------------------------------------------------------------------------------.
 * |   ~  |   !  |   @  |   #  |   $  |   %  |   ^  |   &  |   *  | ( [  |  ) ] | Bksp |
 * |------+------+------+------+------+-------------+------+------+------+------+------|
 * |      |      |ISO # |ISO / | Vol- | Vol+ | Left | Down |  Up  |Right |      |  |   |
 * |------+------+------+------+------+------|------+------+------+------+------+------|
 * |      |      |      |      |      |      |      |      |      |      |      |      |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * |      |      |      |      |      |             |      |      |      |      |      |
 * `-----------------------------------------------------------------------------------'
 */
[_LOWER] = LAYOUT_ortho_4x12( \
  KC_TILD, KC_EXLM, KC_AT,   KC_HASH, KC_DLR,  KC_PERC, KC_CIRC, KC_AMPR, KC_ASTR, TD(TD_LBRACKET),  TD(TD_RBRACKET), KC_BSPC, \
  _______, _______, KC_NUHS, KC_NUBS, KC_VOLD, KC_VOLU, KC_LEFT, KC_DOWN, KC_UP,   KC_RIGHT,         _______,         KC_PIPE, \
  _______, _______, _______, _______, _______, _______, _______, _______, _______, _______,          _______,         _______, \
  _______, _______, _______, _______, _______, _______, _______, _______, _______, _______,          _______,         _______ \
),

/* Raise
 * ,-----------------------------------------------------------------------------------.
 * |   `  |   1  |   2  |   3  |   4  |   5  |   6  |   7  |   8  |   9  |   0  | Bksp |
 * |------+------+------+------+------+-------------+------+------+------+------+------|
 * |      |      |      |      |      |      |      |      |      |   {  |   }  |  \   |
 * |------+------+------+------+------+------|------+------+------+------+------+------|
 * |      |      |      |      |      |      |      |      |      |      |      |      |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * |      |      |      |      |      |             |      |      |      |      |      |
* `-----------------------------------------------------------------------------------'
*/
[_RAISE] = LAYOUT_ortho_4x12( \
  KC_GRV,  KC_1,    KC_2,    KC_3,    KC_4,    KC_5,    KC_6,    KC_7,    KC_8,    KC_9,    KC_0,    KC_BSPC, \
  _______, _______, _______, _______, _______, _______, _______, _______, _______, KC_LCBR, KC_RCBR, KC_BSLS, \
  _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, \
  _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______ \
),

/* Adjust (Lower + Raise)
 * ,-----------------------------------------------------------------------------------.
 * |      | Reset|      |      |      |      |      |      |      |      |      |      |
 * |------+------+------+------+------+-------------+------+------+------+------+------|
 * |      |      |      |      |      |      |      | - _  | = +  |      |      |      |
 * |------+------+------+------+------+------|------+------+------+------+------+------|
 * |      |      |      |      |      |      |      |      |      |      |      |      |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * |      |      |      |      |      |             |      |      |      |      |      |
 * `-----------------------------------------------------------------------------------'
 */
[_ADJUST] =  LAYOUT_ortho_4x12( \
  _______, RESET,   _______, _______, _______, _______, _______, _______,      _______,     _______, _______, KC_BSPC, \
  _______, _______, _______, _______, _______, _______, _______, TD(TD_MINUS), TD(TD_PLUS), _______, _______, _______, \
  _______, _______, _______, _______, _______, _______, _______, _______,      _______,     _______, _______, _______, \
  _______, _______, _______, _______, _______, _______, _______, _______,      _______,     _______, _______, _______ \
)


};

#ifdef AUDIO_ENABLE
float tone_qwerty[][2]     = SONG(QWERTY_SOUND);
#endif

void persistent_default_layer_set(uint16_t default_layer) {
  eeconfig_update_default_layer(default_layer);
  default_layer_set(default_layer);
}

bool process_record_user(uint16_t keycode, keyrecord_t *record) {
  switch (keycode) {
    case QWERTY:
      if (record->event.pressed) {
        #ifdef AUDIO_ENABLE
          PLAY_SONG(tone_qwerty);
        #endif
        persistent_default_layer_set(1UL<<_QWERTY);
      }
      return false;
      break;
   case LOWER:
      if (record->event.pressed) {
        layer_on(_LOWER);
        update_tri_layer(_LOWER, _RAISE, _ADJUST);
      } else {
        layer_off(_LOWER);
        update_tri_layer(_LOWER, _RAISE, _ADJUST);
      }
      return false;
      break;
    case RAISE:
      if (record->event.pressed) {
        layer_on(_RAISE);
        update_tri_layer(_LOWER, _RAISE, _ADJUST);
      } else {
        layer_off(_RAISE);
        update_tri_layer(_LOWER, _RAISE, _ADJUST);
      }
      return false;
      break;
    case ADJUST:
      if (record->event.pressed) {
        layer_on(_ADJUST);
      } else {
        layer_off(_ADJUST);
      }
      return false;
      break;
  }
  return true;
}

