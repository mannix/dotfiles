sketchybar --add event aerospace_workspace_change

for sid in $(aerospace list-workspaces --all); do
  sketchybar --add item space.$sid left \
    --subscribe space.$sid aerospace_workspace_change \
    --set space.$sid \
    background.color=0x44ffffff \
    background.corner_radius=5 \
    background.height=20 \
    background.drawing=off \
    label="$sid" \
    label.align="center" \
    label.padding_left=0 \
    label.padding_right=10 \
    click_script="aerospace workspace $sid" \
    script="$CONFIG_DIR/plugins/aerospace.sh $sid"
  done

#SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8" "9" "10")
#for i in "${!SPACE_ICONS[@]}"
#do
#sid=$(($i+1))
#sketchybar --add space space.$sid left     \
#--set space.$sid associated_space=$sid     \
#icon=${SPACE_ICONS[i]}                     \
#icon.padding_left=8                        \
#icon.padding_right=8                       \
#background.padding_left=5                  \
#background.padding_right=5                 \
#background.color=0x44ffffff                \
#background.corner_radius=5                 \
#background.height=22                       \
#background.drawing=off                     \
#label.drawing=off                          \
#icon.font="$FONT:Light:15.0"
#done
