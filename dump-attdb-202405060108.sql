PGDMP                          |            attdb    11.8    11.8 0    5           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            6           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            7           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            8           1262    41194    attdb    DATABASE     �   CREATE DATABASE attdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_Malaysia.1252' LC_CTYPE = 'English_Malaysia.1252';
    DROP DATABASE attdb;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            9           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3            �            1259    41197 
   access_day    TABLE     T  CREATE TABLE public.access_day (
    id integer NOT NULL,
    serial character varying(12),
    name character varying(20),
    start_time1 character varying(20) NOT NULL,
    end_time1 character varying(20) NOT NULL,
    start_time2 character varying(20) NOT NULL,
    end_time2 character varying(20) NOT NULL,
    start_time3 character varying(20) NOT NULL,
    end_time3 character varying(20) NOT NULL,
    start_time4 character varying(20) NOT NULL,
    end_time4 character varying(20) NOT NULL,
    start_time5 character varying(20) NOT NULL,
    end_time5 character varying(20) NOT NULL
);
    DROP TABLE public.access_day;
       public         postgres    false    3            �            1259    41195    access_day_id_seq    SEQUENCE     �   CREATE SEQUENCE public.access_day_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.access_day_id_seq;
       public       postgres    false    197    3            :           0    0    access_day_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.access_day_id_seq OWNED BY public.access_day.id;
            public       postgres    false    196            �            1259    41205    access_week    TABLE     R  CREATE TABLE public.access_week (
    id integer NOT NULL,
    serial character varying(20),
    name character varying(20),
    sunday integer NOT NULL,
    monday integer NOT NULL,
    tuesday integer NOT NULL,
    wednesday integer NOT NULL,
    thursday integer NOT NULL,
    friday integer NOT NULL,
    saturday integer NOT NULL
);
    DROP TABLE public.access_week;
       public         postgres    false    3            �            1259    41203    access_week_id_seq    SEQUENCE     �   CREATE SEQUENCE public.access_week_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.access_week_id_seq;
       public       postgres    false    199    3            ;           0    0    access_week_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.access_week_id_seq OWNED BY public.access_week.id;
            public       postgres    false    198            �            1259    41213    device    TABLE     �   CREATE TABLE public.device (
    id integer NOT NULL,
    serial_num character varying(50) NOT NULL,
    status integer NOT NULL
);
    DROP TABLE public.device;
       public         postgres    false    3            �            1259    41211    device_id_seq    SEQUENCE     �   CREATE SEQUENCE public.device_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.device_id_seq;
       public       postgres    false    3    201            <           0    0    device_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.device_id_seq OWNED BY public.device.id;
            public       postgres    false    200            �            1259    41221 
   enrollinfo    TABLE     �   CREATE TABLE public.enrollinfo (
    id integer NOT NULL,
    enroll_id integer NOT NULL,
    backupnum integer,
    imagepath character varying(255),
    signatures text
);
    DROP TABLE public.enrollinfo;
       public         postgres    false    3            �            1259    41219    enrollinfo_id_seq    SEQUENCE     �   CREATE SEQUENCE public.enrollinfo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.enrollinfo_id_seq;
       public       postgres    false    3    203            =           0    0    enrollinfo_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.enrollinfo_id_seq OWNED BY public.enrollinfo.id;
            public       postgres    false    202            �            1259    41232    person    TABLE     m   CREATE TABLE public.person (
    id integer NOT NULL,
    name character varying(50),
    roll_id integer
);
    DROP TABLE public.person;
       public         postgres    false    3            �            1259    41230    person_id_seq    SEQUENCE     �   CREATE SEQUENCE public.person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.person_id_seq;
       public       postgres    false    205    3            >           0    0    person_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.person_id_seq OWNED BY public.person.id;
            public       postgres    false    204            �            1259    41240    records    TABLE     T  CREATE TABLE public.records (
    id integer NOT NULL,
    enroll_id integer NOT NULL,
    records_time timestamp with time zone NOT NULL,
    mode integer NOT NULL,
    "intOut" integer NOT NULL,
    event integer NOT NULL,
    device_serial_num character varying(50),
    temperature double precision,
    image character varying(255)
);
    DROP TABLE public.records;
       public         postgres    false    3            �            1259    41238    records_id_seq    SEQUENCE     �   CREATE SEQUENCE public.records_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.records_id_seq;
       public       postgres    false    3    207            ?           0    0    records_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.records_id_seq OWNED BY public.records.id;
            public       postgres    false    206            �
           2604    41200    access_day id    DEFAULT     n   ALTER TABLE ONLY public.access_day ALTER COLUMN id SET DEFAULT nextval('public.access_day_id_seq'::regclass);
 <   ALTER TABLE public.access_day ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    196    197    197            �
           2604    41208    access_week id    DEFAULT     p   ALTER TABLE ONLY public.access_week ALTER COLUMN id SET DEFAULT nextval('public.access_week_id_seq'::regclass);
 =   ALTER TABLE public.access_week ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    199    198    199            �
           2604    41216 	   device id    DEFAULT     f   ALTER TABLE ONLY public.device ALTER COLUMN id SET DEFAULT nextval('public.device_id_seq'::regclass);
 8   ALTER TABLE public.device ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    201    200    201            �
           2604    41224    enrollinfo id    DEFAULT     n   ALTER TABLE ONLY public.enrollinfo ALTER COLUMN id SET DEFAULT nextval('public.enrollinfo_id_seq'::regclass);
 <   ALTER TABLE public.enrollinfo ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    203    202    203            �
           2604    41235 	   person id    DEFAULT     f   ALTER TABLE ONLY public.person ALTER COLUMN id SET DEFAULT nextval('public.person_id_seq'::regclass);
 8   ALTER TABLE public.person ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    205    204    205            �
           2604    41243 
   records id    DEFAULT     h   ALTER TABLE ONLY public.records ALTER COLUMN id SET DEFAULT nextval('public.records_id_seq'::regclass);
 9   ALTER TABLE public.records ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    207    206    207            (          0    41197 
   access_day 
   TABLE DATA               �   COPY public.access_day (id, serial, name, start_time1, end_time1, start_time2, end_time2, start_time3, end_time3, start_time4, end_time4, start_time5, end_time5) FROM stdin;
    public       postgres    false    197   F4       *          0    41205    access_week 
   TABLE DATA               w   COPY public.access_week (id, serial, name, sunday, monday, tuesday, wednesday, thursday, friday, saturday) FROM stdin;
    public       postgres    false    199   c4       ,          0    41213    device 
   TABLE DATA               8   COPY public.device (id, serial_num, status) FROM stdin;
    public       postgres    false    201   �4       .          0    41221 
   enrollinfo 
   TABLE DATA               U   COPY public.enrollinfo (id, enroll_id, backupnum, imagepath, signatures) FROM stdin;
    public       postgres    false    203   �4       0          0    41232    person 
   TABLE DATA               3   COPY public.person (id, name, roll_id) FROM stdin;
    public       postgres    false    205   ��       2          0    41240    records 
   TABLE DATA               |   COPY public.records (id, enroll_id, records_time, mode, "intOut", event, device_serial_num, temperature, image) FROM stdin;
    public       postgres    false    207   ��       @           0    0    access_day_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.access_day_id_seq', 1, false);
            public       postgres    false    196            A           0    0    access_week_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.access_week_id_seq', 1, false);
            public       postgres    false    198            B           0    0    device_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.device_id_seq', 1, true);
            public       postgres    false    200            C           0    0    enrollinfo_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.enrollinfo_id_seq', 23, true);
            public       postgres    false    202            D           0    0    person_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.person_id_seq', 31, true);
            public       postgres    false    204            E           0    0    records_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.records_id_seq', 4, true);
            public       postgres    false    206            �
           2606    41202    access_day access_day_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.access_day
    ADD CONSTRAINT access_day_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.access_day DROP CONSTRAINT access_day_pkey;
       public         postgres    false    197            �
           2606    41210    access_week access_week_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.access_week
    ADD CONSTRAINT access_week_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.access_week DROP CONSTRAINT access_week_pkey;
       public         postgres    false    199            �
           2606    41218    device device_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.device
    ADD CONSTRAINT device_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.device DROP CONSTRAINT device_pkey;
       public         postgres    false    201            �
           2606    41229    enrollinfo enrollinfo_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.enrollinfo
    ADD CONSTRAINT enrollinfo_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.enrollinfo DROP CONSTRAINT enrollinfo_pkey;
       public         postgres    false    203            �
           2606    41237    person person_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.person DROP CONSTRAINT person_pkey;
       public         postgres    false    205            �
           2606    41245    records records_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.records
    ADD CONSTRAINT records_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.records DROP CONSTRAINT records_pkey;
       public         postgres    false    207            (      x������ � �      *      x������ � �      ,      x�3䌊�142��03��4����� 6Q      .      x����r��֥����@x�!�{��x�y�>uott��G]�BR��gﵾA�� �p���j�0���.Q��fh�߁�4��\G�1�ر�б�J��lM�l�)lm��u��m�_�Pǩ��?��Z��C��*��G՝f���:M:�O�����v�7���*��D����������i��U�.i�ve��y��y��k���o}>X'���?�x�Ka�\f�I����?�x��d��|��(ږA]l�q�Z�y����y�[�T�KyY���r�ѝ�(OUu�P��L���`�dx1jraC��t����A�uF��ɘ����\�VFWˡXc��̪�+a��M2,j;��0ͼ��k!��~lw�x[��56���9��x=~�&�\��iA�/C?�H��>�&�����%�?����^�1t����
����<ϸ���
��E�;z�O�,�3eú��t����qg�|�u�S�TlV[1�
7;�w�Dr�^�a'�"��M�`H�zNG*�-���&��ׂ�<��l�}�F�2��bvs���:,�jB{���6�f�w�I�>��n�p�E�1��aux���9.�W}�	4�fCv��h���魴=�5oR��WV��
S��ۥ�>_�D���8M/�����o0�I��䒪�<�Q�,��g�'&�W#����OoZ���Tc�.3��ށr)EiǖL0J#"��"��\X�	R8��n�ŷ���;���b�W�=k�l�t�E����%_j�T1�:fA���P>q�M�a�3"HAd�i5T]��q�A������i������~d�D���o�s|�����BN�9�ZHL��/~������*���[��Y������~zW�RdK8`�jo\R�P	�����?�H|���h�@�u�>)�]��P���]Pk��Wky�{�q�r͊�?ȟ�:��V�	V��16+����.O#H�7%r�V�=��������C�� 
3�~6��ovm������z�:����B�?���񼙝/�v<�T�,���o�K�W�ץ�י�0β�ЊB�[�x����M��ig�����6ӟ��|v�qj�x��B��hXg'�¾^������u��)��)�r�5���!�7O��� �����8�,d+	���w�Y��Y��w�q�d����t�F�_L�Y;��i�hd�w��hNoZ��L(����\�yNd�Y������g:���Q0*;9n	���c�A%M}D+�sm��8�)\�/ܘ����M�k
��F��Z+�((�0?j�,J�x�hY�+r��t�nӞ�^h���̚i��95�Z$b��c��K�?KFH�v�1Ͱ�j(£Y���͈j7��5�'}�E "P���>���>x-�#F����6�Ԯ������%�2N��/�8�$hAf�^��q�r�E�E�-hM'�V�̧Ϲ|M4�F����H������S�U�̜���A�~����{�+iP��S�>(�T�[�B������3K9M�i�6}{���6[H�,��
3i��Э�R�I`�>$�m��k�{dGS���Rv��i��%#�
[�:|e���=8ۚ��H5n��I�.����#�����o�p���{u8��Iԥ�9Sj�:Ř�����"��÷Jv0J��bZ�^��*��w��
�9ƶ�ǳ	�V�FI֠0Vԡ�)�;��C���$�mӋZ<�kBl��$�/���!XU���������Ѐ+�_L��<O����0���d���ď������.�у+��sA�^eN(UzʝG��zq}ʬD��]�<�P��e޴�m3�$��zgI/E7�Щ�yB 悠e���v��)�˾sE
��fCɲ�+���)��]\�n��Hs����2HJ���f���nY�
����l�;���o~�<�z�Q���]��m�4��S���p�g8��aG��$����䦍�j��MF (�?K�=�h�H����h��fVԂ7؁��
9�K�c�p!�����%�yG�ds����@02Wij��� ��"C���E�������"�d�DÌ�(g���)��R|I�$���eל��2-�X��m�a�m.�ܜ���x���c���C;���io�-\��yJkh���i����&�5�MOO����6H�V�4���L�~���j�����ZrB�ƀd��R����]��R��,�Ȋ0�Rs^������p�p'3�;Ξ�E 吺h�ޓ���:���e�q�h��8���2�.Lv������6��Oo�=�A��[�P�w&�<�g�M�K"Dm�}��g,�7�\�� ��0,�O�4{e`����׈�R���~,�ot�ԅY5��99�����6��ã��bڥ��Oέ�*�*��"���H�p�4��o���u;���Wu��".�/��.=�_����d`!�n�h�ݛ���n�����sI�nJ��P����y��`�A�|�^��
��K=�����
��{�Y�#����'4v�}$���S��¿7��Y���o�*)E�+vY%49�*�މ��/����`k��8>_��V�;l��n�M��29�B3�L�3Q���*�i���&�)C|�w;&5Lh5^��`��g��dD��Nvx���o+Y`������p��vke���.ޥ�vF'YR8C���1`�*��R�nrTk���4����b<[�
~+
���*/4�w|�k�YC���4w��r�10�NЗQ�e����蛀eH^V��J�q�{m9�����͗���夢�0j9kJ���bo;kn [mB�PfW��|�5Kt�)����M��?ɜN�/�7
e��l����
k�ed��K@����[�ϰ!Xᾆ���u�?���w��[�����r����_Iʬ��
87�����I1�h�n�Q�Wz�A��ܟ��Ȅ��'yN�D�%?p��%h�3�Q;<�q1|���D�5�fZ�9zv�%K	f[ϜUmJ����s�*��-�װ{u���dA��bd��s�'�L5����n����1�Ut��2>0t�dU'ur}��Zu0�|/R2�����@�
D%�L�x���àB�{��g��z�+���.����QW��\�Ϗ�>g�D������,[~�͟IX;��%�ʃW�����������340�͚Z�V���I�9�32	�e<_�Ι�N(������F骸��3Q�z��o���5ȧq�N�0�=4o=|~em�d�� �D��1.�@��|,���Da�_�`�ɬe�]`"����D�PC �	N��(jŴN���d4���s�y�;��/�B�����K�Ι����Ҷ
��E��y� jic�Uǵ+Ҳ?�?w/�L!�i��g�	qO`���h�'(I�羜�߀qW�?g�7�j��F�/��>x#�g%�:��r�B��B��ی����]0n
^���JZb��z�o�)�._yldx#2�2$�q���8�J��_���̻%���p�C�Ǟ�.�1��o>؇/؛y���Q<;F���]�t�vUh���w8�5ǱU����<�4$���u=�f��P���m����½�(���/�J}�~��>z��BHXZ~w�X��]/���Þ8~s`eY��!����]�� �X_���8����9:�D$ť�1�S���#)�� �ywa��܎Ҹ^��1$��#�-�lTJ4PlNW�E7����������@��=c<��#K�(S�s��S��8;M?γ�J�y�=��R/�E�bP�t$�i�[�>'��9o��4����d��L�;􋡃��/���f�l����g��	�HZ�<|"~oy(��6�F��ڹR�'(gJ5���K�za15�*a��L/������ l���T��g���#G�����fy���}5���X��^�	�e�`B�֑�x9GRN0~�x�hNi<��3�~������*�hm����n\��d� y��]׶¥ �"37LP��p������;,;��~�%p�C�í��T���X^[�ϱ,��&�_ֳ9�)��c��M�B�2�vj�f    �v{�t�aS���,���۟��A��d�1mK�<�� 4/�o+�����ڄ�h��"��v�q���LLS�����>���b�m�&���qu����ڸ?��̂2��^��'Y!|He������C$�����dZ!|%Ol��*7�Wn2�j�p�E�}�T_��s��@�y��Y����HX.�(���t����L���|�Q�����?�ɶ<%�HV(�d���f����An�w�3m��9��������jc3�k
�X��0�����n�=�)�'�����w�s�<*B~��I��7�膊��M���wy�62XC%҄FAg[2s\VK)c��;B��ܦ营nV�$[F@3G
ҷaܿ������nRUJ�sb�g�d�y�6�o�@15r���#�l��")�r�x�TF&�������zd�ù��B"��'*ݖ�����&�D����9E����e��C��m�9#��npV�5��I�f[5a�I�ggM��7f���@TÞ�I$�|hm�3���&�N붫�g�f1�B�s�l���-zV#c�_�c�#��A}����A�����P��T���ޘ&�����]^�7����b�Q�HvCe*V�� �f��l��}���Bg�]�'*�"�P�eΟ�PV8�����A�1 ��T�h~��x�u�����A�/<X�-�S�P�eP	������%A�n�e~H�/WJ������^ᇤC���)ڲc��-/]:�E��[�!B�
j������NR{ ����)`x�8��Fzq���p���2��V��K�Qm�,z�8������W��<Y��[�c��k>���๖%]�S� ��4w��VA%v�z���}z��}ާN;E����~V��ҁ���ݰ�i{P��ǖ��/D�2����4)gnk�����)]Za>���� 4X�xב�A���	���96Ӧ9��
$Z���X���3�l��u&��������]��h�)WqD�B��ʇ��_��R{ǘH*�+'O�|42�,�9�OqԻ�:s�E,�_����7y�������� a��$!���+�jޝ���`
g�,7�鿟OJ�h�WFi^��&'��g/��Y��^Z��õ<��H%W񈶉��d�`-ӟS�<ͩHZ�f�ȿ�� M�$~��K�~�������Ű�	R�/wRg�� �Jj�
�@�p������;p�S�[Vst..h~�6mF37	?��}�cH5� W�M�@�Q��>p��I�����$��s�
IQ}.�ԓ�x�"��~׻j�7�Y�q��z��L�~�{����|�?u�9�����J�� �I��K��mR�nsƼA2\\0أ2�����r����2XU�s2�:�Y�tG�ޭe�%\X32�LEw����5G�^ԋ�pWE]5U7'�jK^���")����o�����	B�w�r�������w�����i�t2���Hp�6�m�N^���އ��t�eo�k1�̓&U2�]����T�̀�s��*Ib�TǒR��^��L��P�lXv��tb���m����e,�]:�Z@q%�0n7��&�����Z����OJ+��W���,X+�Jؤ��N�r��(��P����_�4{Z0՟2i뢞�*�m��3�@�(������AY�M��f�� �.��c/8>���!iq�8���%�c��Y��X�ۖ؃F-�@TY���p�Z���A3 nj��� ��h	�g1\��<!��{w����P�j��������BD����	mx!I1�^UУ*�D�6>@|:V<�#�Y�-f�/�
����d�����KI���3���U��z�ᓫ�¥����!e}��	}�����[pN���-�ԿW�C��	�����cC���z2�%,�����V�;k����C.�}����t{��IB�&}:�#�D!	�W4�x}8�����mN��)�W����%�4� ��ʪ��?�����Q�P���Xw�[��0�Вlǖ^���H�|���{��qz'��_��:��6������:yfGjp�?Fn<� ��p֧��cHj��G�^+y�~���ڶ�{oÑ~�Tb>B�ލ�r�&c.�&�i�e��I�V��
���^��@����D�Z^Ԋ5�����z��G�DG�ͽ2Ͱ�_ﴠ��D��4������3�0]ApЬ��鯋� ��N���V��l-��qu����.� ~����c���?@8���q/�DeA�`� '��yI�ri��.@ri����HƜ�;�SG�wx���/$�D�ϒ�MO��
e��ߕd0ї�5�p~\0�a�Fv��.*0�%�S�m߇�-��7� �����2ӡ5қB=Q��I�d5���|����M���)P��@����B�o8ޫ�Ouɒ�~�n���ddXy)'�������5�'_L��"1%�.<�9��G�؃��R�/�� ���F�iE�!m��-"K=k=!�wm� ����̻�'!�p"FN�O<�p�}a�b�w�ŉd�%[?�N�K�IBz�T�S���^,��'��ꂖY]�,`�A�pv�d%�?�W����{��r�؟���P:�]�
���8ZT�	0�>[�z��g6�@K�Q���������5.���4@�c{S��H2J�������
�0?����%��р���t��FJ��+�W� 
�鸕A$<�/O�
��lN�X�d��U��&�������rqB�����V�u�vA�} ���*r�P�&(��Rx�ի`V!uS���Y�V�̷����\y�,Op��Tߴ����E/��ؿ;r	�����#�^�q���x��������@^����d���|R�q�X۟C��
����aK]3!����_�Ѐl�4�4T�>�C�l�T�G���v}9#U�=��L�Gʔ�!���:�& �k��d9�.Aֈw���zMb�y��@c���s`n�Hhd�[y��FL�N�����:��P�p��M%�)�Y�~Z���ϡ���BЄw]T,1�=N��zQ�*Ф�6������ujQ���ޜg�����P�a�r�%U&ܝ��� �~�nG<ۆ��QFƱ5�p1�P1���j�Vo���E\6gw������b�7�����Us8_%:���C��<Ƭ�撦�a��y3��
M��F!{�f�LA�h��f�$����>�,�Ka;�t��4�����I��ˊ���F��Y���(�b�í�Y{�#к�-/7S"��^��xo�hK��{*�L}g�MYŅ|̦�����oB��`_�i�e'\J�oM[g���{�	,(��ļvޟ"+ǫ�'���@[�=l�T|;��|G	�a�������P�V��o\⸗q20"V:s�>��O�w XkV��TE�\;.^d3���	-z �y��yz�����{q�k���%��%d�,#5Un�42�7r��E��H�4��e�KyIL��Zr���#�%!JbHgb�M�>A��,�i\%��;���1��kzF��o��L�ܬY�x�v�/<��$y�j0�2X��0+'g�a� �`|�ǧ�JEӠ��%`W�q�'��=(��݌Vσ����{v�vu���X8a�*v�d���l�:)�Q�C��z�CU4�R������ �r3	���q�b�7?GHtKUڟ�R#̧���5�`L7�,J���lo�֐�ess<��n��J�{,�Ϡ"��ͨ�9{ٛ ����:�Q��\]\]���M���w��#�T-��&|k���ʄ���nȯ�J��>3� �Pw�x%R�*�w���H���4�J���넅jˢW��:>�ZV�T^Г�>�Ɗ��"��4��SD�ޙ��H��z�w���;a�OZ6��Y�������"����Ag^]�_L��5Ǳ�ZE&�W�������X��SUcs�F*�_x�yt���
T����n&���G�=��3[��8yl�91&�+1HE3IO��O�\6�ˢ͡F�c���&��>    ����v�s7�&�OD��i���t�;"^zr�&�^�y��P�-���OA�t�m=6���bVCɑ��F��r{?�t�����8�����z=�Y�	I&�<�,�5������`����*Tt��nR�S������(���/�̫ �=ܻ�Շ�$ �X�%����K�����I�0'͕�۬���+<D�'�
��F�5�i�7��Ib�P��9�Om�E/��cQ~�����rW�u[��d�O3K�`�`A�E�;H���6B��L⾳�t����}2�����r$;ƛ鳵����?�)�>K���\���9���1S<T��BG�F�1��B3��Ι�!?�n�A������u��׼XXu�c�_���fh��S��h�����pd(�q�u׌"��E��:�)R~D7��n��U���"��voȵf�G`������*#���������e�Eu��T�ʭ1T��|3����c��Lo[��7��ݝ�CW��$��`磢��j�����S�H
���[���*g��Q�!���$;�gL�+d[�J3��Y�����'y�v�nX�3�)���T;ac]D�B�b�����B�D�T��Y=,�F�4,Z}�6�Tb�@a���<�q!��K���>Z&�[�����i�����c"���A�f��ˉ~�Ք�*M8�B"�ZM5�ӤT����h�'����֒)�X��j��2ݛ��<mͭ��z@��0�P����՗�S� ��KWyD�������͇e�M�,Ĩ�7�SB^��	:�V��vY��S=�G(!�=�$���0F����������w���rLtt��u��T��7�Ml��+�W��A}�\@��zL����+�%^ц#��C	���5h�~��0�!�L�ˬ@�ӦE%dQ�FK2�̽}*n��#Kռm<
�W���h��ԋ�@%S�E�k$܃�}�(���� f<u��l����Vd�9 �)CMw=d���e�q�TM!%\�7��ذ�Z���y-����+ӟ�g�So�\�.ӥy����[�&������^�T�*�Z:�@���8�8m�f��#�Sɝf-I����vW(u�ӋLѤsuċ�f�}~�h��=�����������u��j���-2�D�Y(<S$Mޮ�����5d"՞��w7��}�Q)�U�/�0����2�w$������/ ��M�hF�>&��h�1��>�luDH8��a���$�6��vJ�AB�=����(���FJ􋱻X�p�@��s��h�:�l�៚�r��ٰ�{x��FQ�R}����G�]��I��xҔ0ۓO3f��[_��Aв����4n	)iW��h�j����a���x��Y���f����Z!�'[���r�d4 #��	����<a�
Tm�pZ�>���}�S��� W���;X�0��]|6֭�8/�����kbu�����p٥����_��2$D>[�("���og�M����V�[�.r3��ǒ�26Pp!�����B�߼�x��k�Z�Je�Oi���F��� 3j�5�wq�Q✩��ZC\ȿ[�϶s�r!25AI�y�E����%۠���v=y��Q�Mc�E���徬,D�{�σ�k�u��c����ϴ��t�? ��\<���4&�Q/��둮~�{._�#�}�p������L����(�J8�[.^��W{&�Z"����� j'~%^a�M����B���H�mS����K|�g%��e���S��QM츾ܯj�~�rNV{�S�;���윗ђ��$0�@z�E#�����mаX��A��Kl���R�9Il�ʶ�<A�0ܓ�É�x^���mƿGs;�b�Z��L����5�y6��O�M��C\١��V�KTK��=2�9H�fFM����\�i�z�")N�bX����Pg(CU�m�96���U��ѯS�}q�����@0S-��?]�1�R+Kǋý�0��L�͊�b�ʭ�� �g��Ώ���~il����OB0$<������L�̕������Yo�-�_�;zD�wk[�l-S����p��/Ԓ� F-�����*��Lǎ����8֛ߗ�/��4?ɚ��}�@Z0H;�/��g_8i��Ǯc/We\7�Y�2���ή~�k`gE� Z�ŵ�Y��9��փ��\}��߭�j�Vsԕ>�(��_!���q�ͮ�A��1��9��R6�p���':���JZ! 2n`r۷�_�>Q� Q��Wf�;�	hd�7ޭ�w-�?�^�?98���{SK͎�L7a�fnJ���{R�y@�a�Lf��#ǭH*�o`p댖����xt��	��oKQ�J�p��2ٞ��_�8���32���S��mk��9��#�a!�)�_��I/|S���;D��$��tm��Y�c(�7�Rx��3J��-6v����y}�T]˛Д>'n!In�+Ɜ�0�9D	$E���qٴ`[�����'M���ҁ�f{��1�ܿ�T�:'�!w:���N$�_�W	'jR,Z����]x������[��У��)�[�����L� �+R�:r4<�m��S�ޮ]�Gi���x�R.��!ρ���1��y��}�X�-�SLͯ�A㷁>�.z]r�Ã�2�����z�4l��GI�5�^5nxU�ώ`���>\��w�8���{6+�$!P��9IL�sc<��,�[�{c��7�	 P:e	��\�|�`�u�Q��Ʀ�|�'\I>d�^*;yư�~(���sB�A���<o?:�@qThE��v��7^2p�S�BZ)�+��!��$x	��)iʚe��J79"��T9{?�x�鿛v��wH&���[&��0t��H�|����D$��8�v��*��>X�8f��n 0T���v��)n�2�T�q���Dtݠ1m��n�S@�v����t��_8
Hy�a�E]���o�����-s7G��^R	E&�K>8t
�@C��Z��H���G���*�#bd�O�f{§y:�������W�`hq�.�|�q�`���5LC�DB�ZR}��S�0��O�BdL����S����c1���E���\�N���~O��C�Q������5R��uǅ��u��PE��1����A?ez�����(��<e�k�ˤ<S�&W�C|@L;ne�ٍ�i�d2X�,����,���;��9�ñ����>=k�Y�%m���	c��:��f O��"tF�����]�K��e��z���$�l���
��p�}VȨ�ܨ��Rk2�N86Z��gf�%J�Y)�KX���%3���-gH�2��Tl����{�=��-���{�oq�e��S:=�Ϙ��?!w�Itl�+)�zG��g�Hf}i�	��O:�n׸׼�<�~��.&�e?������v�"���C��NČK/J�HoX�i�t�V�L�o�/L�>ta��@4Ŝ02s�L۬��xvW:�ˊ)�^� �ʴu??�[=Ļ
�}�o�j�~	b��HI�V�L�<�-��X4c��2-�<l���n�h���*O�7�y�q8�J{�m�S1Y�~f�N�^uA��i����1N�3���}G3m�� ���~s�2m��-��@��|J����e��sv�u���f�aj+��NR�����Q���x��М���|�˶}�����[��$H��2��l�)�/��Rߺ./m��+�4�;`AՋ�<k�Zs�ts�5���r#N��U"({��%�0u���u�X3�TW�n)'�_�cA��~�>��x��y�_�{*slg������ $��S��j�E�ThW�K�r�REwO(M1-����q�o|T���[)V��}6��>���RĐ�$�X���K\��=��D�� ��}W�&�̋�I��^�Z�p�fb���$�$y K�n�W�d�ᛇ��ҏ����-�	;�U�@ʒU�b��9S"��6WE>�Qi�C1(� �/���k���RL�����O��ތ�{��y���#]��uLN`�
���5D��Ű���o��    d1 ���L�V��� ��K|��q2���BF�G�XY�E�����bqJ��Չ:Uk�K�S�0�OF��G��%M�$��M�!X�հ7T9Vnɵ���͇V�[AQ���Y�����$� PA!��(�1�?}�w�Cݪ�A����tP��/�������#��JF�,D�R곮����p�1 E�ᖚOV!Y?x��.^5�މu����\UE�M�9�54�����,�,�,�:\�r/ͪ� ���a{@(���,ųJª�Տ� k -���|�Zl�B.�#奄N�\�@$�������_��7'Mi����{��E��M�J{O�3/xS&	�˲f�U���=��q�����|9��xσDk��L�����;k'�-���_�b3�dJ�'oi[	�2��pg�	��p�ȱ�-`���=����z��/��G��u�`G7$�C'=�K�9���I�M���c��z����I_��"~�����><7�� �+|U��U���Te���|(���4n>����BK��[�z]Ӛ�N+P��7�	�S�i;���0W3�jv@�<9���iwn3-�]x����-:��2�Z�������b/��O5ю��}}L��8��v�p�Dp��R���v�6���Qt>A0��j��R��we�f�މ��P�����A��@��i�bN�۠��+�<.�k���?}a���b�tY���>}��"�9<��e�:�������Ň�3�l:�Ux!�8����t�hı��ڧ�F�Z��9ɛ��=�~j��ݿǑi�:ފ������p�Jhv=U��H�v�8v��BU!C΁�9��M�s(��"������8:�-Gu(�~�E���hrf&�� �|}�={�uw�,���$1��Q�w�m�L���&��@��'�fY���#}��-v���èo�����E�-��l����K�O��f�����唛�F���E2���e�����&0���'��! /�4C��q����*UKJ�
r���;����l��A�n���L:]Y��|�[N�(=��m����qE+�a���r�gX�!��?(e���K�_v�d�$�8�v�տ�|mt�W4Ά1�E�>�-_�R>��y���O7�0�@~�
���46t�4��̰q���5q$��HھO-ݨ��2���2O)�{+�7~�sה���/������ F~�PH�������� 4()�ͺՂ����f�(����Q%s��r�%�aG ��x��<��l�]"���o:"����6���KW��06���ﾲ�jb0�C��~�������5�塀��'�8r����A_q�tƐ�Kv|�!��3���Ǘ}M����K�e-�ׯb�"���ִ�!肀:��KG��kǈ��5,�
���	��y�\�Y$?��75D�J;�cʜ��d�C�h���<A�Lx2��\��2�l,�"�tXm>:�\&i�Z���>h_�7���=���sP�Б�E�F�_P��:��q~���a����W���I�`7WCjBz����r�Sc�-~�ȫh�R^IP��=��
���=G[Y% }:�4߄�R<$\l�br��m{H��%n>���h%�W��q<�(���sAA�%F���W�x��mq�r��������lo�SN�H�K�+Ѿz�k�u��*�-������q�K)bJ�mi}B<�\rK�H��e�{ɚabqo%�J ��'�g�n\ɺ#�Iv�Y���w���\�t�}ć�5�?�xؠ�����2�f���G�JY(�	�4y�ɣ���)�<7v��q#L�$I��ɼ���M��t�Wۢ�?�z��qĒ��X��@V,�b��u܊'�zѠ��d�F3^��o��5�σ�-�#�B�u](�郴%C����ˋńK��ay:��=�/6l�9A�o�5��r'��Y�^�<(�W���'Y��`�н.�ha���'�Q��~��I�<�<0,ѿq���g�#���[r-��P�|�.��27ܴ�Ŗ��e�1?��~=;��x����Ͱ��rs����Tҗd���_Ϋ���.����o���҅FGN�m�JFρ�u�&)E�H,����4���??U&�(q�|����Êfp���|<�j��~�_���uy�e�"�K�e2EXMMpBpgke|�〬!]~p_�1(�G?fP���F�q�EP�v��^Z�\D��$~���I��Q�����ݟ,}l/T=�-�9�X32�[Y��7��g.H#�kn顰��L����u7ϳ������&�N��B�:ɒ
��QcD��]پ�G9��%`�e���['�H�iM���eE_^��((w|�?B��9[��j���7��n�N�QT��R�^��h�}��ڲ��I,�Xl,�n�E����*hͨ�����m�O���H�{?�	�������ۓ����hH6���ͥ&swb�R�:�N//4Ū[P��5��c����&uI]����^������|���L���/6'�\��~��2	�b�{�8�.�3�Q��^��7	�]}ˆO��{0�������B|�1�X/�{d��KP�Nп��<��WX1��.BYvYܯ�U��8�G8g�Wv����ͻ/b�����'�'����)��p�"gj�X�h���d�g��b{�2�u����7�%������g��M��D����qqG�|��I��Z���_�x<�B���o��O�7�#�|am���zK1rm��`���ވw^�6;�����������s�:��'�sI��`ʵ����Ec/N����g��ѷ����hM�Ofs
�x��/bau��P����I������;���74=}��o�aV���
&����e��J�F��R2�i2^l�T}�	�?���8��2J&Oss�I�X4��^����0��S�B��ٰ��\�������R^L�}(Ћ��~�kIo�	a�K�2[��v���5���ʮ-"?��<���w�.���_f{_qF���k��%b����,����d
�W���2�{ilp��7T1���;�້ga�@��ãU_���D�?C�kh;��\��j#�(����]���F���܍Pw���/�KAB��w9A�#���94jV	#I���oU���o����Ā���Y��)�{�����3I���>����fڮ!���D�k��s�3`��F�B����� +����f����&k��4J��lԦ�v{�J �ҤAK��)��qh�?�0b`�EMS��
�`� P�Q���ࠡ�\�c�\��g�(���t�9��]Q[3��}���.؎�",��X
�vKl��$��!�:�i,�pW�tq������QE,S��t;����\�����~x���D�YD�V�����N=���M�i��+[DBy#��B�֕��>��[LL��y�;53V�&Og�]]�y]�١C��q`G����}�KPz)�Ns���@�+��311��=M	�oo��_�݈�y?�w����e��(B;�Y�C|3ܛ���F֭p�k�긩�;�+�}�*e�;��&2��v�+�vE�4�F�b?rX2%t��q3��K�������i�-�%i�f�sy`G�S�,��V�x����YV^��k
X���`w�k�[?�^� ��p�}�t=��c���JbI�f��9yY���g�t�!�Tơ�u,PN
���K��lo!�^,���.�eC5���`�ʺ .	�E��^��w��̓���V�mn�A�٠��V���NȀH*��mK�1����^�����q�<�yx�)�}�Lo�+-R�����ڼ{G�ҁ���u �=����8����n�8(�K��<d"�=@���=�7�A:uWK���ǔ�Ce���7����v������M�dæy��rhr�O�}��]�22����-�~�8G�����V9cӊ�7���e/�%����R�>����V� �R~6�+�>O�Y�������N�� Σ�O��/����n�e���C    �@�\�l�m�k蘀�T(��9���x ���b�*�����n� ���-��a�iҲ?�](��]�u�vFUP��>�E�\Z�C�KM��� T�E!�J[�࡫!-9�^�&���6��g��1�W�>S�|��s!��4�\$u#t/���n�]@̨*(��m
��������o	��*#=~�:�T�{�Wuvg��u��p�ۨ�i9�-eII�m\��6˧��L��	����x8+_�l�i�1o%'Z����>
؜;���a!�=�w�wK�d�XV����=K����2/��e*BL�"F$�+!_Y�fm����?���½��������\
�y�
�����w�����ٻ����Y��x���iT�CW��P�/zavF�}�%w9�����/���f<(����͚Ix��Q��
�#����Ğ	u�')���}F�(���F��V�Y��?��t�:�	I�O!��f�c����_^��c��a�n�A��p����Eu�~.��jE�{�:fT��w>EZ�Zn«��;��)��߮���4k�]����ͷ�_�vZ�|��WN��� ,���;w}��Cpo�
\*��X���x�hS��]N��X����>�I~?(n���,F;%�G��yEGǬn봗��}q���x^�{��>�RX6-�D����Ⱋ�Ȗ�W��b�+y��Bh��S�1�E�	e�L��~�������$�-�|u#xŔ���hrcdA�=��y����`4u����_��9�K��}Thf����Ζl�����<(��>�
us�*D�l�<��9[�X�9�l�ˏP�(C���Џ��B����~�|慯w�w��1��/]����Me���ͯjo�;׊�����w�����Vك�c�|��Ӹ��6���<�20��t�S�,�>--N�6��S8����`tU��U�P_ѳ}�bk�yԯ����hT
���������'�⸢\�6��fK6���=8�A���ǌU;Я#y����!w�	p��x��dC�'[.�w��L�o���t:��8^i��SLwһ��,Ns���y���r� ���6��1�C����;)@��(��8�3�V-��������ICYB/H�a��|�h��i�Q��l��(cKO��NߞԐ"��V�)[]%��\.���<h3�x��w��bT��M�]ǘ���%��>���N���д�T��,�s���e��5��J�d�h��e�g����W६��a��U��)��3ٽ}�J�
n}�l׸�cY0}~�*�Y��4V�ڶ���:IG�E4�8������R����)X2�b��`�}�&��M�#���i{L!@��R�� m�ugS��5%�6�O���=1h�e�Yצ�L��[&�b�������3��)��sB?8�aT2Ob��^8Ц����X��tм��]?>�6��1L�Kӹ�z��F�=#��t>��w���+-7��k9��������� ß�����j�U���Y"�l'P�_7}{>��+<£�q����P�W@�]P�t�p��=feE�}��Ϗp�جѢ3���8B�_)2_K(Cw�ɱM��:!��X�%�Y㝆�>s�`�;����K]���C�-uy��SI���y��lSy�{�ź[��F`h�9���,��:�yb؋����@ߴfБo��r�yrK�i`����^��6��}Ėay}�,T�q�=�%�G��K�=�&�j�O�N�.��b���J���S�7�M�g�F-�����]�K��KYk�(��Мd��N���\����{�����Q�}?k�<��f��9�{�*!�LƵ���e�p��t�ҵ3�B�.�K_86�=�Oݶ�t��t��*�,�z�Soy����Id�H`��lo�4Q�>�NOx.[ X�0	�Xg� tPu�P�snp:8�T�` �VSH�c�"ɔ&@b�=��>�3b���S�V��W�q��PQW��F�(�ȡ�I�տ Qv,x��ڧ�;c3�"�$�^�Zc�I�b�j��	����_
$1�!��ǂ||G������Q�I�W�*/39�4i��lm�mwtp={=l\[6������1_' �Ѯq��Oj���� �-�,�h0x�Џ��dv5����#O�@��i|O篝.�D�ܤNI���c`x�^:F� �� G���^�Kt�U��Von�Ra���_��Q־譜[Z�n<�r���fjfW�!I�g�9X�1�â��t�����-v#j�.>G]�b'�xJHYI0��f�+ܲH$8��"����H�@9m�{Z�0k�/CI��M������vo"������o�|K��`d$���\`���u#,���?��a4JP����|[��j�렔�	p�%[��hq1{*��2ۦ2�C\���D[ö�W
F-Va�9굝�g��GU*��F�	�mrDŤ�������+����orn�����W*=�7� ����/��7�=y������8��,DY���r󸚁>���v�;��)͵A�;݋��+D��d����"��t��J�p�˙_ O�������!��-k��
Vؘ��9��Ą��	H�F\���GG��]���
R�o�GCΗ�_���e��?t	-!M�i��,qo�EO��F�`�"A�9�����L�4ϧ�C��/e$S��	DR���Gj/Q��c�|��%,Ƴ�0��:v�<��nE7��t�Bb�X��t��N��`���q)j��<�z�f��ޣ���~�l@1�U���x��'�Rn���]�R�';"��Ƕn|4��L	�F���q��uV�;��������w�"�I�͇�bv�cF�"%)����Q��!_bL"F��bl�R�t&�!��YNz-X��ϡ��!�S�$o~�SeW����}�]c�^A������/�,��G�>���2sD�4 �����)2W
�)X�D;��=|t,3��H,�v捿h�� �����_�c���w�Q0�F���z���7���F	9�����0�K��s�
�,o��8w�w[L���[���wð?"f������/F��d�T�:�9_�h�3#r���P�*Jx?�ȋ��ϫ׵�e1��V�\�t���D)X�Yz�gLU:�r��u$�M?B�*4(�jP.W�*�,�67��4/��-r
N
*�<Gp�Hgus����l(���7����_i����	�H�N�O���B@�}��W|&�;4�,�M�A�j+QkK��&4�F�O�
2E�l��O<|��]�D�����`��?}"՟ �����0���U�Gڽ���
�'D�Õ�oX2�u6��җJk��4S�(�$P��c����w�%x��p�#6o��7Ӌ�nt'zH<�q�yg��p�"S��� �%���	[0~-,!��J`zmɍɛaV�:|>������UP�
�?d��^��q�6�)O�V��M�ޫ[�nJ^��X}z�zR�H��Ӳ@N�%p�����z�$H���uj����T��sP����.ܩ?}6j]$�<�bc�>����Fu&�
���1-�[��jT������_��G�9d�!�'��s�-��,�ȟ��R�ݮ��e�0���c&J4鞊��u�	m�4u���Y~0c����
k�Wi���� ,�����s��IYCӊGQ
WX����I}��ne��6��#[Qqݛ-9ѽ��t��h!F�x��N"��y���w��{
Uh;w�g��p"M&��=bԯ���a�� p���-�rf���1w��~�ٗ+�ר��r��-�!�O�{���%�<��H��p5�.|�j���-��׀��gr��h����=�4��0lӌe*���̅t�lc̚IAL-�+W��6�^.�o���%/��놝��7JG�~���A��|�y�aȍuX�/Q�I��_��[ɴ�\{�-yZx�X<�/�E/��-��>c��)�	��vp�7���0v��K�f{�%=kW�YL�mY�b#+ Rf=�x���ΰ���?r<��ڵ�n�B��F    ���|����n��P�иD���(?��1O�W9�+��J7F�vf��v���a$����ӛൟ�Q�3����{Q{�L�D0(�����m5n����˹U���'��I�F�c��`K$��6��O�?��(�>�����G�@��T��j/�ߓ]&-�w28#8������S�a>�ŀ��e6R��x�	EOE��4�i��HJ ����ָ�}��fv�|�'������f�
������%��%��C��Ԓ-��lj�b��gGF�eo��ڻ��0K��6��|���x4D�,�oF����tNG8?��rA���{��u���W����3�A�u�Z/����t/�,����a���J���ܼ��nq���Wl-}0�,�`�~Kp���b�2��5y�vKߢ�hۆPW"#�R1R	�G�A�=fS�1���ҨN�3M?A7^c���NO�B�Te�}�/��A&���(e�ڍ�`#[;B�Oؚ@e�	0CK̖k�+�S?��fhx`筫���ܶ��������U�&�������J�n쓽��3��p��ʳ9�,�T�|�]&"�p@��C�ĺeu�D�u5�kT���� 0�H����u�������*^�5��8>�{��')\[��8ry�q�x��$e�S��_�)/�S�V�+]�Kv���y�,�tϼ����죥TĬe
�ӌ�
t�M�ΉY�g�yK�^#�EZ�����5�5�8������$2F
�S�?�&��[�� Z���^�F��"����d�M2M}��ɮ^M���[=+�0�*$w×�y��'<>sxR���T��G�L2�����޺H�E�S�(�)Yp��{�5ޡS��p[@��~�����b��r�Z:�����e�sj���(k����|w�d��]�AF�-���y+|��(��~D�M#�Os��P+E<U�!��}��������_��q�b���	��*Zf��y�&6��Z�H���1��l׌\��O��C�95=�o_�%���HĞ��;Dc
���l�+��-㪷�����e_Xd~����&Dn�p�'��n_�M�?��'"���k���v���ᚵn�LBZ��>u�oY[���-zh�'����Z�TQ1��� n��0����'�W}4�M�>��{{�vE4��ac�b{��s���t����ɷ�n�i��hT�ߓ����H�_�إ��E]�b_R�6@�]�����������E@d�{a'����F%G�s����u�J*�4&
���	�n�E��l3�M�2�}Kw�|\1c��I��c%4��w�0v�|hȲ��L��:6�r������˧���<���5�7-��ח<�6�5�"��1N������;�ó.G:�%t	�/��qa��1�s��z���������
#��-{ �����KZ������Rh�8�Η�z�(3��m�lG��,�-^�sEH;h�3�$$�+��a[�����M,!d�d���ep:f��Vt�e�X����=��X�w��g���Z�`�vR{���ğ�nM��:~���F�1NU���!x�~n2���;a����V������s���r�c�L���9�栂���>lO�����q����j}&zK���\+�Qa#�$�ǃ�	F�yH�-w�Kީ��DM��ِU�Qi	������c�u{*,)�_@%j�	�鞯����{�^��(�a!p�o��C�K_m���r�'b��"��v	����wcn�7�'s�T]�!*B3D��}#j�.T���D�l	�J�(!��Q��w�0 ]ː���3�g	�npA��ؠ�d��W<T�#z_b�)�����+���w���8&��a����pѹO�������q[e�&���S��]���86�ke�@��������9�F<ov�=��B�-\���g?-�%��m��� 1C݈�.`�$
h&E�/?ܿ����Fi��w�AY��Y=~������`d����.g��D�=�d�1�q�ǵ�g��a�/�Q]��/ l�E����@�_N�\:�M���)=�a��c'Q�i6�	����
>��{����=߼�ED�d�sװK-�_�+�#��0(ߟg��]r�ˡ� �3tQ�ڦ?ؐ̉�&�!��K\׳f� )A����m��/o�����v�\���Ok�h%�ؙ��OC�Xߍ{
?d��&u��Uhp5�Y��n���,��e4-�~m��9>��z����v�d�j2_�x��a��~�a&'��-�IllK����Z%�c-,:b��6��h�6�;��qq��1��?z�x鄍�|�.?F@/���3�!ٵ����4Y�]�T&~g�"��'��B�Q��$��\�5Â&RG��+s��wU$L��-_�q�g���5�������mZ�'�Xڇn��\�D$�O���
����yrD�y����Bj����y��d���p �%شW�̀@�i�����Y��R���xqa�p�(�i�=���+.Iz
�r<i���� !�}k�A�����2ly:�o���7�	��bƚ���1�;��F��Sۦ���E}��-�a��
6㼸+�*}��&���%���_�<>�"��J܊�$m�5���@���(�䱓"��,��G<�쭫('l���BM�܃��hB<�\i�>0q��	��\�@���4{�R80p�3̜{u�	z��.�+�o}������?���qU�ŕ���+~����kD�x�[������{�G��q�?㪢�f���;���[�E�}��=�4��V���Y~��Yz!|�rE=�kۻ��P�xi��D/��'��0��h:t)���Zs<+��(@u�2~Dl�zݘ��=F�b�a���u%6����٣�7�.>����v��Y�Xv�I.������]B�zsN� ������xcЛ.��$.^%*
ꀢ��;�<�
��	�mҘ��!�>c��aSRDr�`5��i���o  �4C��}G���j�
�A�<��+-��j��t�j?(�PCQ}P,5	O�0�5�Q��L��w���ݣ�Z о���		�u�/7|6����f¬<�cN�1�d!��+�ὂ�Q�I
�+i��b��i~g�Sh5MH(g�2f7�u��&m����O,6n�N-O4ُ�i�wd�hFע�?��Q�ƅ���?�
�š�=�	�ǹ(����,�ƃ5A�轝�2��;�=�������"��T>���SU�,��,l��/�+�d�z!G�7x=K�>��yӭ<��}��3$�Fڅ+x~�?T𱜠κ�^\ic�H\��u������LX�7���>�JPB�؂��km���jd��G�>0J=f�x��]��`Gij�c�M�C���clډ7�FOke�ǎ	Ȑ�e�᭑�Ͱ�΃	e��}%�m�˅Od���*�q͵ި��$t���8ȴ9P�y6��Iɡ6�h�us��'?�����^�d:	���P�.��'������[��ӽ���
-UT?�Ի�Gh��pk����u���$������M+e����F��[Ğ�T�̒e��-����t95�~�WP]��Z�"�(t�W���C.I�1mQ�l��pt�1j�{�����ȭkx�0�d�eBS6�v	����{ǣ��>��aPC�"7�,���Tȫf�w���(N*��z��pf|)��~���U��

�5C�~��
�m��{y��Fz!.F��g�"��훪���eLŅ�n���{=p�X���.&9,h���'L��Mi����R5up��>D�Fʛ<��K�^�Y�Ζޅ�/uVZ��~~����eTd�+��m�1�o֧���vO�B}�Ǳ�a��\�z�$"��7�:��`���G�L��=��$�'-܍p�Xo�`v�fZ����
2ᤊ��/�4�/�u8o��J�f��J,�g��w�!������p�y]�`z��ț��f�6���|vB�6���<�?�4!9 ��g���܄��{�`y�?�    ��Jk����'����Ӊ�<����Eg��c=/�ۢ�Jb��ˡNP�O�-|�96%)s�A�}r��^|6@��w��W@��3�Y�������:��*OO0�l�'O�Ѵn�-C�S�è�9�0{{��	U-j��Olz��C�����[�|�$?i���]���0�	������SpF'�Dۣ2���Aq����	4��	!!Y�p�-��6��<�v_�rrM�,ݍ+7"ܷO��՗���k´������wO��?�ۨt.������0췍��	�蓿C�Mr��5���2�r=��ש��&u#����'$�BD�m���"\�����&�.OIz�P�%'_¨�6g�$<�����"|Q���eKg��{&��7c�o���mk���`���؇����Rw�w���+K�;9��Y���yXfq�4��(�oo0��p�t�Hrg��=*q���A��]_t�>�g��e�+D�OG��yr<����a����eypf�+&�4���a͛Q�oZ�Ř�"�qG�5'W�댏�x���tGx����'����W9=mG�H��i���+:þ@�K_<��5�Z@-��k��O9�����8}���?����~��.<"�{xt��W*�yG&�&?���/D��	��Yz�j^�C��L�ELS������.芫�=���u銪^`b4M����`ݦ��ͩ�;KЌ����A�ݛ�?�O�%g>Vᣦ��o ��O���Uy���;nm�e�s>]U��|�pOj��\��s̈́�P�R!R�/l�*nyy���;���N(��Ki�|���_�L3ߜ�&�㢚i�n�Yu$k���@�J�FV�0
�!�ٝET��8eof��dB�����Ӧ{���U�r7M2�WD��Ǝ��0�L���3�D<��l�4���ޫp����C��5$_	�� ������rُӯ���DBЀ�M(2�qѫ����\�b�e"-K����b����~^�H�q�a�v
�1��D�e�f!�h�
��C�<�\�ߙ<��'@��BԎQ�	Xd���+.����q���Gr^��Y���h`�z�jh�eJ��� MGe��k'p���5���c��1��G�������Kц]0L�L�ߕ��bF	|�|"(]�pn�Y�+���B7�@lG*rK��󇎧��&p�������<O����^��-R��6έ���^�z���քa/�F��<�p�@��@��LV{����o�L>����W&hF�FJ�Rt�So�.�=��x�#6��}ҦʃYw@���.�e$'�>�/���:�߱�����%�V6��OJh؁C��Y�,���1��4�;��b�|�>���O>���XV��¤���."�9�m����C\�Ӄn�?t`���\�#Ug��;I�>���ۗ��ǅ����籖~80[�ف$�����|R��K�H�� ���I�����/~;1ô�>����r��uG�9.L�v#p���9��ʽ�j;%���m��*i��K�5�F�i��������n% [ 53皂��l~Xн��)��y�{����͏����Zo5��W�_���*�q3��#ӿ2���"&�j�;��#ۯ"T�AJ>��,ޛ]'��e�):�����n���Q{[%���r��?�����%\��K����s��L�K��keJ,�E�8��@�sqC4����D۲x4�����,��{;
h��,��]��Y3'+\��E�3r6�[��>o��'S��᲏���-z;;s�X��J&�@�t_������<���E�Y�V�y�+&���D�Mq���hz��������=�+<�)W�Y������n�۷?�?����ϟ���Ie��������{��x��<DS1�<�ka����)�8�[��v�xl��!'כ�I��_�
�^����^O�@M�/���A���~�p��4J��B	0.�#��'?̣v�l��U3)�[`w0��0��e�Kp�����`�j��H�[��7P����$�Y	���*D��1�^�1��<;z��b4p��/ �BY�e�w����~��@:A#�8M���;�_� ƃ-K��ܒ� �?{�П�R����c氊��]H1��%{t��m�?I�Q���=7D�� /a2��<:o^�S7��uH���~ <Jiy*���ϭ/��4�O��Q� @�ƕ��T�%^��C��;�p���i��m��#�#�� xmDo��8���g�A*��P���U�G�׈Ol�-�rnZ1���a�RZ|.��d��|$�o�O��饋<p���C��c8r�$� ib������qS^"_l7�,���W>���<^<���<���Ƴ��M� 2��e'��}�xk��c?��'��ƽ��OF��7�)d��%!�<���;�Qw���HL$9�V����hq�	(O��Q�U�t���^���i�l3p�p�T��߷%0� �$'��l�2$gG.w8�������"��ޏ���!|F�{ӗ��]����r��1ׅ�S*�B!�"x6%moa<F}�0�Ee��Qgh.4�"o��<������ �3l8u��Q�cѥ�-��mz}�6��`��7��� >|�ԯ����8K��;6�A<=��U����R�O�q�bY�I��5��htZ�P���>�K�A��E�&ذ�l<:0r_�W;��0
bY�"��v~0A�	�4��Q�X��&,��湛�I������H&���c��j�MuS��ydQ�=7���Kb���I0��Cj;PVߩ�o�����Ի�hzojU�I��܇�%2����ݣ���yi�O����j�	[+��(êf�Xa8���'�/�<���b\׺5�U9P�7���W�ҏ��]-�$�>�a�c�Kz��|���Q���RE(���"��H�� �0?��n�����d�#����
b˙�O��>
H��~��m�W����P�}���z���ð�䪦�sxZD8h,q BaQ1O��֣"~����DV��.���YTs2�j�s��G�$�Y~=�Y��5�Z�������Hkv�Z;���k޿����z�ڷ������3�*��'��ͱ@@����n> ����/�4�����7�إ��e�����ap���r�&��\F�V�?�f�𩭫3&��")�u^�rD����u
!�*+���8j3�����DX�z�~�H:٪$o�k�[CY8�buuw��h��׀�s��H���A~��+��5~~m�`�Lh��8�UZTv�-�Q���S��b�2�w���j7���r�~[=q�|/RaL����%h/VKl����{��8�:p>]�������J��q7�� TA�5�l+x����-Q�C�2��x��0�B�z���?@�L&�:�謯���wG��!M�_:?��dw���_�9�O�{��Q�~��_��vu7
%��5��o�7��sA����풦���c�	���<X�t[�;.] ����Z�iZT��+�>����x�Ã������p(>��f��q8���Gt�)��j��M����� d~�/�?'�G���{ڇّ����z-�0�X�7���~H�a�]�\b��˰�R�lo�sb��9�&����<�
Vq��s'LS�����稭*}2Q�3#/ZĀ�ix�m0��] ���ԓ��N��_�Ïc�Jn�`�J+5�A�ص튗���
�U|�}K�� Z'�K����LU$.�l�Л�F����tU�-*��ݪ�/U�)���Z}�i�.����#�r'����q��&���U �$��ۯ2O.nP��ؘ��env�_ka �/�&���[�QFA�eI��mv�[f��g:�
�+�M����$�ݎVM�T����n�E_�~���mΧG�fz&#^�I��l�i[��x�E	��k	R�~�
���aV�	t���v�ƴ��f��%�#0�4�sQQd���>�/^�R�t��Q��gkc~�P��]r��ߙv��e�6a�7f�jԗK4�{�����"�MI�%5�3�ɉB������-���X� �   (�H��>�8=����+�z`촻�E�i����w���3��x�Pv~��e)�gy�|���23�|U��I��m����1E����x1~���0ȐfHS��<�W��"w&z��K�kD+��_[�A�y��#BU6moPQ0G9����F:������߿��Ű8      0      x�3100�L���4������ ��      2   X   x�}�1�0�9y;*rBRڼ��	!���L��Y:�B)�<!O@��ˌB��r��.�Z2ނ�k<����g\c_�F����{a���%�     